create table Employees(
  employee_id int auto_increment not null,
  last_name varchar(25) not null,
  first_name varchar(25) not null,
  middle_name varchar(25),
  age int not null,
  current_status varchar(25) not null default 'employed',
  primary key(employee_id)
);
