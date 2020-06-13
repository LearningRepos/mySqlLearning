-- char has a fixed length unlike varchar
create database testing;

use testing;

CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));

INSERT INTO dogs (name, breed) VALUES ('bob', 'beagle');

INSERT INTO dogs (name, breed) VALUES ('robby', 'corgi');

INSERT INTO dogs (name, breed) VALUES ('Princess Jane', 'Retriever');

-- decimals are decimals essentially and invoked in the form decimal(digit_length,digits_after_decimal_point)

create table items(
    price decimal(5,2)
    );

insert into items (price)
values (7),(2.5),(3.22);

-- float and doubles store less space than decimals but less accurate then decimals
create table things(
    price float
);

-- float truncated the decimals in this case because I had a huge number past 7 digits

insert into things (price)
values (7859493.9437594389043);

-- date, time, and datetime can be used to store date and time together or individually

create table People(
    name varchar(25),
    birthdate date,
    birthtime time,
    birthday datetime
);

insert into people ( name,birthdate,birthtime,birthday)
values ("Mihir","2005-12-21","13:43:45","2005-12-21 13:43:45");

insert into people ( name,birthdate,birthtime,birthday)
values ("Cheems","2020-4-20","4:20:20","2020-4-20 4:20:20");

-- curdate,curtime,and now give th current date,time, and datetime respectively
insert into people
values ("Newborn",curdate(),current_time,now());

-- can manipulate date and time queries for data
select day(birthday) from people;

-- date format can be used to format dates
SELECT DATE_FORMAT("2017-06-15", "%Y");

select date_format(birthdate, "It is %M %D and the year is %Y") as 'What day is it' from people;

-- datediff can be used to find the difference between today and the persons birthday
select datediff(birthday,now()) from people;

-- date add and substract can add/subtract a certain amt of time to selected dates;
select date_add(birthday, interval "1:1" day_hour ) from people where name = "Cheems";

-- alternate notation of date add and subtract
select birthday, birthday + interval "5" month from people;

-- timestamp takes up less space than datetime but cannot store dates before 1970 and after 2038
create table comments(
    content varchar(25),
    created_at timestamp default now()
);

-- when inserting with timestamps it automatically saves the date/time when valeus inserted
insert into comments (content)
values ("Clickbait");