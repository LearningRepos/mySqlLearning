select upper(reverse("Why does my cat look at me with such hatred?"));

SELECT REPLACE(CONCAT('I', ' ', 'like', ' ', 'cats'),' ','-');

select replace(title," " , "->") from books;

select author_lname as "forwards", reverse(author_lname) as "backwards" from books;

select upper(concat_ws(" ", author_fname, author_lname)) as "full name in caps" from books;

select concat_ws(" was released in ",title,released_year) as blurb from books;

select title, char_length(title) as 'character count' from books;

select concat(substr(title,1,10),"...") as title, concat(author_lname,",",author_fname) as author, concat(stock_quantity," in stock") as quantity from books;


