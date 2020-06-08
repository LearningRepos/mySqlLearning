CREATE TABLE books
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

/*Concat Merges sections together*/
select concat(author_fname," ",author_lname) as "Full Name" from books;

/*Can use the as command to clarify sections*/
select author_fname as "First Name",
       author_lname as "Last Name",
       concat(author_fname," ",author_lname) as "Full Name"
from books;

/*Concat_WS adds a string element between every section to minimize repetitive typing*/
select concat_ws(" " ,author_fname,author_lname) as "Full Name" from books;

/*Substring goes into a column and splits the data to your choosing in normal non index numbers*/
/*1 number means start and goes all the way to end and 2 number parameters means go from start parameter to end parameter*/
select substring(title,1,10) from books;

/*Can do substring starting from the negative side*/
select substring(title,-3) from books;

/*Substring shortcut is substr*/
select substr(title, 1,10) from books;

/*Can combine concat and substring*/
select concat(substr(title, 1,10),"...") from books;

/*Replace replaces entire substring of a certain string with another string you provide which is case sensistive*/
select replace(title,"e","3") from books;

/*Reverse reverses a string from end to start*/
select reverse(title) from books;

/*Char Length finds out how many characters are in string*/
select char_length(title) as "Characters Per Title" from books;

/*Upper and Lower shift every letter into either uppercase or lowercase*/
select upper(author_fname) as "First Name", lower(author_lname) as "Last Name" from books;

/*Distinct gives you all the unique values in a column*/
select distinct author_lname from books;

/*Order by gives you rows sorted by numverical desc to asc order or alphabetical order when specififed desc/asc*/
 select author_lname,pages from books where released_year<2000 order by pages desc;

/*Can use a shortcut in order by where the number represents the selected category so no need to type word for word what category you want to search by*/
 select distinct author_fname, author_lname from books order by 2;

/*Limit gives you a chosen amount of data so that you're not bombarded by queries when you select*/
select * from books limit 5;

/*Like is used if you're not sure what exact thing you're looking for (enclosed in 2 percent signs)*/
select distinct author_fname from books where author_fname like '%jh%';

/*Removing 1 percentage sign(borders) on either side restricts queries (start with or end with)*/
select distinct author_fname from books where author_fname like '%da%';

/*Underscores in your like query essentially states that you want something with #of underscores value*/
select stock_quantity from books where stock_quantity like "___";

/*Count counts how many of each selected column there is*/
select count( distinct author_fname,author_lname) as "Count" from books;

select count(title) from books where title like "%the%";

/*Group by allows you to group the data and then manioulate it to your will*/
select author_fname,author_lname, count(*) from books group by author_fname, author_lname;

SELECT released_year, COUNT(*) FROM books group by released_year order by released_year;

select concat("In ",released_year," ",count(*)," books released") from books group by released_year order by released_year;

/*Min and max gets the minimum or maximum value of any column*/
select max(pages) from books;

/*Can use min and max with group by to find the max/min of a specific category*/
select author_fname,author_lname,min(released_year) from books group by author_fname, author_lname;

/*Sum sums up a particular column*/
select sum(pages) from books;

select author_fname,author_lname,sum(pages) from books group by author_fname, author_lname;

/*Average averages up a particular column*/
select concat(author_fname," ",author_lname) as author,avg(pages) as average from books group by author_fname, author_lname;