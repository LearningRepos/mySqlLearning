create table Students(
    id int not null auto_increment,
    first_name varchar(25),
    primary key (id)
);

create table Papers(
    title varchar(25),
    grade varchar(1),
    student_id int not null ,
    foreign key(student_id) references students(id) on delete cascade
);

INSERT INTO students (first_name) VALUES
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

alter table papers modify column grade varchar(3);

alter table papers modify column title varchar(50);

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select first_name,title,grade from students join papers p on students.id = p.student_id order by grade desc ;

select first_name,title,grade from students left join papers p on students.id = p.student_id order by grade desc ;

select first_name,ifnull(title,"Missing"),ifnull(grade,0) from students left join papers p on students.id = p.student_id ;

select first_name,avg(ifnull(grade,0)) as "average" from students left join papers p on students.id = p.student_id group by first_name order by grade desc;

select first_name,avg(ifnull(grade,0))
    as "average",
    case when avg(ifnull(grade,0)) > 60 then "Passing"
        else "Failing"
        end as "passing status"
       from students
        left join papers p on students.id = p.student_id
group by first_name
order by grade desc;