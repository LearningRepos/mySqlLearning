select * from books where released_year < 1980;

select * from books where author_lname in ("Eggers","Chabon");

select * from books where author_lname = "Lahiri" and released_year > 2000;

select * from books where pages between 100 and 200;

select * from books where author_lname like "c%" or author_lname like "s%";

select title,author_lname,
    case
        when title like "%stories%" then "Short Stories"
        when title like "%Heartbreaking%" or title like "%just kids%" then "Memoir"
        else "Novel"
    end as "Type"
from books;

select title,author_lname,
    case
        when count(author_lname) = 1 then "1 book"
        when count(author_lname) = 2 then "2 books"
        when count(author_lname) = 3 then "3 books"
    end as "Count"
from books group by author_fname,author_lname order by author_lname;