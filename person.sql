
use person;
create table user(
	user_id int not null auto_increment, 
	username varchar(40) not null,
	password varchar(20) not null,
	email varchar(50) not null,
	primary key(user_id)
);


