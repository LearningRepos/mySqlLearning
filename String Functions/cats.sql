create table cats(
    cat_id int not null auto_increment,
    name varchar(25),
    age int,
    primary key (cat_id)
);

insert into cats (name,age)
values("Jelly",7);