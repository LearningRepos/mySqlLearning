-- creates a customer and orders table
create table customers(
    id int not null auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    primary key(id)
);

-- can add delete cascade so that once a customer is deleted, the customer's corresponding orders are deleted
create table orders(
    id int not null auto_increment,
    order_date date,
    amount float,
    customer_id int not null,
    primary key (id),
    foreign key (customer_id) references customers(id)
);

-- inserts valid data into customers table
INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

-- inserting this with a customer id of 3 would work since a id in customers table has 3 in it
insert into orders (order_date,amount,customer_id)
values ("2020/04/20",420.0,3);

-- inserting this with a customer id of 432 would not work since a id in customers table does not have a 432 in it
insert into orders (order_date,amount,customer_id)
values ("2020/04/20",420.0,432);

-- old manual way of searching with associated tables with no joins
select distinct id from customers where first_name = "Boy" and last_name = "George";

select * from orders where customer_id = 1;

-- cross joins are very messy because it mashes every single table possibility into one
select * from orders,customers;

-- implicit inner join since only shows overlapped parts unlike cross joins
select first_name,last_name,order_date,amount from customers,orders where customers.id = customer_id;

-- explicit inner join
select * from customers join orders on customers.id = orders.customer_id;

-- checks to see highest buyer
select first_name,last_name,sum(amount),order_date from customers join orders on customers.id = orders.customer_id group by first_name, last_name order by amount desc ;

-- left joins gets everything on the left table even if it is null
select first_name,last_name,sum(amount) from customers left join orders on customers.id = orders.customer_id group by first_name,last_name order by amount desc ;

-- right joins are the opposite of left joins
select * from customers right join orders on customers.id = orders.customer_id;

