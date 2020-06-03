create database shirts_db;

use shirts_db;

create table shirts(
    shirt_id int not null auto_increment,
    article varchar(25),
    color varchar(25),
    shirt_size varchar(3),
    last_worn int,
    Primary key(shirt_id));

insert into shirts
     values (1,'t-shirt', 'white', 'S', 10),
    (2,'t-shirt', 'green', 'S', 200),
    (3,'polo shirt', 'black', 'M', 10),
    (4,'tank top', 'blue', 'S', 50),
    (5,'t-shirt', 'pink', 'S', 0),
    (6,'polo shirt', 'red', 'M', 5),
    (7,'tank top', 'white', 'S', 200),
    (8,'tank top', 'blue', 'M', 15)
    ;

insert into shirts (shirt_id,color,article,shirt_size,last_worn)
    values (9, "purple", "polo shirt", "M",50);

select article,color from shirts;

select article,color,shirt_size,last_worn from shirts where shirt_size = "M";

update shirts set shirt_size = "L" where article = "polo shirt";

update shirts set last_worn = 0 where last_worn = 15;

update shirts set shirt_size = "XS" , color = "off white" where color = "white";

delete from shirts where last_worn = 200;

delete from shirts where article = "tank top";

delete from shirts;




