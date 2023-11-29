-- 1. List the names of all pet owners along with the names of their pets.

select
	po.Name as Ownwers_name,p.Name as Pet_name
from
	pets p
join petowners po on po.OwnerID = p.OwnerID;
-- 2. List all pets and their owner names, including pets that don't have recorded
-- owners.

select
	p.Name as pet_name, po.Name as Ownwers_name
from
	pets p
LEFT join petowners po on p.OwnerID = po.OwnerID;


-- 3. Combine the information of pets and their owners, including those pets
-- without owners and owners without pets.

select
	po.Name as Ownwers_name,p.Name as Pet_name
from
	pets p
join
	petowners po on po.OwnerID = p.OwnerID
UNION
select
	p.Name as pet_name, po.Name as Ownwers_name
from
	pets p
LEFT
	join petowners po
on p.OwnerID = po.OwnerID;


-- Find the names of pets along with their owners' names and the details of the
-- procedures they have undergone.


select
	po.Name as Ownwers_name,p.Name as Pet_name,pd.*
from
	pets p 
join
	petowners po on p.OwnerID = po.OwnerID
join
	procedureshistory ph on p.PetID = ph.PetID
join
	proceduresdetails as pd on pd.ProcedureType = ph.ProcedureType;
-- List all pet owners and the number of dogs they own.

select
	po.Name as Owner_names, p.Kind as Pet_Type, COUNT(p.Kind) as dog_count
from
	pets as p
join
	petowners as po ON p.OwnerID = po.OwnerID
where
	p.Kind = 'Dog'
group BY
	po.OwnerID, po.Name, p.Kind;

-- 6. Identify pets that have not had any procedures.

select
	p.PetID, p.Name , P.Kind,  ph.ProcedureType
from
	pets AS p
LEFT join
	procedureshistory AS ph ON p.PetID = ph.PetID
where
	ph.PetID IS NULL OR ph.ProcedureType IS NULL;


-- 7. Find the name of the oldest pet.

select
	Name,Age as oldest
from 
	pets
where 
	Age = (select min(Age) from pets);

-- List all pets who had procedures that cost more than the average cost of all
-- procedures.

select 
    p.Name, 
    p.PetID,
    pd.ProcedureType 
from 
    pets AS p 
join 
    procedureshistory AS ph ON p.PetID = ph.PetID
join 
    proceduresdetails AS pd ON ph.ProcedureSubCode = pd.ProcedureSubCode
where 
    pd.Price > (select avg(Price) from proceduresdetails);

-- 9. Find the details of procedures performed on 'Cuddles'.

select 
	p.PetID,P.Kind,p.Name

from 
	pets as p 
JOIN 
    procedureshistory AS ph ON p.PetID = ph.PetID
JOIN 
    proceduresdetails AS pd ON ph.ProcedureSubCode = pd.ProcedureSubCode
where
	p.Name = "Cuddles";


-- 10.Create a list of pet owners along with the total cost they have spent on
-- procedures and display only those who have spent above the average
-- spending.

select
	po.OwnerID, po.Name as OwnerName, SUM(pd.Price) as TotalSpending
from
	petowners as po
join pets as p on po.OwnerID = p.OwnerID
join procedureshistory as ph on p.PetID = ph.PetID
join proceduresdetails as pd on ph.ProcedureSubCode = pd.ProcedureSubCode
group by
	po.OwnerID, po.Name
having 
	TotalSpending > (select avg(Price) from proceduresdetails);


-- 11.List the pets who have undergone a procedure called 'VACCINATIONS'.

select 
    p.Name, 
    p.PetID,
    ph.ProcedureType 
from 
    pets AS p 
join 
    procedureshistory AS ph ON p.PetID = ph.PetID
    where ph.ProcedureType = "VACCINATIONS";


-- 12.Find the owners of pets who have had a procedure called 'EMERGENCY'.
select 
    po.name as owner_name, 
    p.name as pet_name, 
    p.petid
from 
    pets as p 
join 
    petowners po on p.ownerid = po.ownerid  
left join 
    procedureshistory ph on p.petid = ph.petid
where 
    ph.proceduretype = 'EMERGENCY';



-- 13.Calculate the total cost spent by each pet owner on procedures.
 
select
	pown.Name, pown.OwnerID,sum(pd.Price) as total_Cost
from 
	pets as p 
	join petowners as pown on p.OwnerID  = pown.OwnerID
	join procedureshistory as ph on p.PetID = ph.PetID
	join proceduresdetails as pd on pd.ProcedureSubCode = ph.ProcedureSubCode
group by
	pown.OwnerID,pown.Name;


select
	distinct Kind from pets;
-- 14.Count the number of pets of each kind.
select
	Kind, count(Kind) as Total_number_of_pets
from
	pets
group by
	Kind;

-- 15.Group pets by their kind and gender and count the number of pets in each
-- group.

select
	Kind, count(Kind) as Total_number_of_pets_Each_grp from pets
group by
	Kind, Gender;

-- 16.Show the average age of pets for each kind, but only for kinds that have more
-- than 5 pets.

select
	Kind,avg(Age) as AVG_AGE_PET from pets
group by
	Kind
having 
	count(*) > Kind;

-- 17.Find the types of procedures that have an average cost greater than $50.

select 
	ProcedureType
 from
	proceduresdetails
 group by
	ProcedureType
 having avg(price) > 50;

-- 18.Classify pets as 'Young', 'Adult', or 'Senior' based on their age. Age less then
-- 3 Young, Age between 3and 8 Adult, else Senior.

select
	Age,
case 
when Age < 3 then "Young"
when Age  between 3 and  8 then "Adult"
else "Senior"
end as Classify_age

from
	pets 


-- 19.Calculate the total spending of each pet owner on procedures, labeling them
-- as 'Low Spender' for spending under $100, 'Moderate Spender' for spending
-- between $100 and $500, and 'High Spender' for spending over $500.

select 
	pd.ProcedureType,pown.OwnerID, pown.Name as OwnerName,
		case
			when pd.Price < 100  then 'Low Spender'
			when  pd.Price  between 100 and 500 then 'High Spender'
		else 'spending over $500'
end as procedure_cost
from 
	petowners as pown
join pets as p on p.OwnerID = pown.OwnerID
join procedureshistory as ph on ph.PetID = p.PetID
join proceduresdetails as pd on pd.ProcedureSubCode = ph.ProcedureSubCode

-- 20.Show the gender of pets with a custom label ('Boy' for male, 'Girl' for female).
select Name,
case 
	when Gender = 'male' then "Boy"
	when Gender = 'female' then "girl"
end as gender_wise_label
from
	pets;


-- 21.For each pet, display the pet's name, the number of procedures they've had,
-- and a status label: 'Regular' for pets with 1 to 3 procedures, 'Frequent' for 4 to
-- 7 procedures, and 'Super User' for more than 7 procedures.


select 
	p.Name as pet_name,
    COUNT(ph.ProcedureType) as ProcedureCount,
		case 
			when count(ph.ProcedureType) between 1 and 3 then 'Regular'
			when count(ph.ProcedureType) between 4 and 7 then 'Frequent'
			when count(ph.ProcedureType) > 7 then 'Super'
            end as NO_of_procedures_label_pet
from
	pets as p 
    
join
	procedureshistory as ph on ph.PetID = p.PetID
group by
	p.PetID, p.Name;



-- 22.Rank pets by age within each kind.

select
    Name,Age,
RANK() over (order by Kind) as age_ranking
from
	pets;

-- 23.Assign a dense rank to pets based on their age, regardless of kind.
select 
	Name,Age,
		DENSE_RANK() over (order by Age) as age_ranking
 from 
	pets;

-- 24.For each pet, show the name of the next and previous pet in alphabetical order.

-- lead and lag

select
	Name as current,
	lead(Name) over(order by Name) as previous_pet_name,
	lag(Name) over (order by Name)as next_pet_name
from
	pets
order by
	Name;

-- 25.Show the average age of pets, partitioned by their kind.

select
	Name,avg(Age) 
	over(partition by Kind) as avergae_age
from
	pets;
    
    
-- 26.Create a CTE that lists all pets, then select pets older than 5 years from the
-- CTE. 

with all_pets as(
select * from pets
)

select * from all_pets where Age > 5;
