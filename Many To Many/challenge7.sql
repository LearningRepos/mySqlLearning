create database review_site;

use review_site;

create table reviewers(
    id int not null auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    primary key (id)
);

create table series(
    id int auto_increment,
    title varchar(100),
    released_year year(4),
    genre varchar(100),
    primary key (id)
);

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');

INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');

create table reviews(
    id int auto_increment primary key ,
    rating decimal(2,1),
    series_id int,
    reviewer_id int,
    foreign key (series_id) references series(id),
    foreign key (reviewer_id) references reviewers(id)
);

INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);

select title,rating from series inner join reviews r on series.id = r.series_id limit 15;

select title,avg(rating) from series inner join reviews r on series.id = r.series_id group by title order by avg(rating);

select first_name,last_name,rating from reviewers inner join reviews r on reviewers.id = r.reviewer_id;

select title,rating from series left join reviews r on series.id = r.series_id where rating is null;

select genre,avg(rating) from series inner join reviews r on series.id = r.series_id group by genre;

select first_name,last_name,count(rating) as count, ifnull(min(rating), 0) as min, ifnull(max(rating),0)as max, ifnull(avg(rating),0) as average,
       case when count(rating) = 0 then "inactive"
            else "active"
       end as "active"
from reviewers
    left join reviews r on reviewers.id = r.reviewer_id
group by reviewers.id;

select title,r.rating,concat(first_name," ",last_name) as reviewer
from series
    inner join reviews r on series.id = r.series_id
    inner join reviewers r2 on r.reviewer_id = r2.id;