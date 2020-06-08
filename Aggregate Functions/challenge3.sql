select count(title) from books;

select released_year,count(title) from books group by released_year;

select sum(stock_quantity) from books;

select author_fname,author_lname,avg(released_year) from books group by author_fname, author_lname;

select concat(author_fname," ",author_lname," ",pages) from books order by pages desc limit 1;

select released_year as "year",count(title) as "# of books", avg(pages) as "average pages"  from books group by released_year order by released_year;