-- char can be used when you need to truncate inputs like California to Ca

create table Inventory(
    item_name varchar(50),
    price float,
    quantity int

);

-- timestamp takes up less space than datetime but cannot store dates before 1970 and after 2038

select current_time();

select current_date();

select date_format(now(),"%m");

select date_format(now(),"%m/%d/%y");

select concat(date_format(now(),"%M %D at ") ,substr(current_time(),1,5));

create table Tweets(
    content varchar(180),
    username varchar(25),
    created_at timestamp default now()
);