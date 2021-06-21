
use person;

delimiter $$

create trigger after_delete_email after delete on user
for each row
begin
update summary set Gmail_users = (select count(email) from user where email like ('%@gmail.com') );


update summary set Yahoo_users = (select count(email) from user where email like ('%@yahoo.com') );

update summary set Outlook_users = (select count(email) from user where email like ('%@outlook.com') );

update summary set total_users = total_users - 1;
END $$


DELIMITER ;

 
