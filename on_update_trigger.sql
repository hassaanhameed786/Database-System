
use person;

delimiter $$

create trigger after_update_email after update on user
for each row
begin

update summary set Gmail_users = (select count(email) from user where email like ('%@gmail.com') );


update summary set Yahoo_users = (select count(email) from user where email like ('%@yahoo.com') );

update summary set Outlook_users = (select count(email) from user where email like ('%@outlook.com') );

END $$

DELIMITER ;

 
