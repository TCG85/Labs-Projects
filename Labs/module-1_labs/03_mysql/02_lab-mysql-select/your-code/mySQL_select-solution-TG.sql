-- Challenge 1

/* 
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published 
*/

USE publications;

-- Checking # of titles
SELECT
	COUNT(DISTINCT au_id) AS number_unique_authors,
	COUNT(1) AS number_of_titles
FROM titleauthor;

SELECT
	a.au_id 		AS 	"Author ID"
	, a.au_lname	AS	"Last Name"
	, a.au_fname	AS	"First Name"
	, t.title		AS	'Title'
	, p.pub_name	AS	'Publisher'
FROM 
	authors a
	INNER JOIN `titleauthor` ta ON a.au_id = ta.au_id
	INNER JOIN titles t ON ta.title_id = t.title_id
	INNER JOIN `publishers` p ON t.pub_id = p.pub_id;
	
	
	
-- Challenge 2
	
SELECT
	a.au_id 		AS 	"Author ID"
	, a.au_lname	AS	"Last Name"
	, a.au_fname	AS	"First Name"
	, p.pub_name	AS	'Publisher'
	, COUNT(t.title) AS	'Title Count'
FROM 
	authors a
	INNER JOIN `titleauthor` ta ON a.au_id = ta.au_id
	INNER JOIN titles t ON ta.title_id = t.title_id
	INNER JOIN `publishers` p ON t.pub_id = p.pub_id
GROUP BY a.au_id, publications.p.pub_name;

SELECT
	COUNT(*)
FROM titleauthor;

-- Challenge 3

/* 
Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.
*/

SELECT
	a.au_id 		AS 	"Author ID"
	, a.au_lname	AS	"Last Name"
	, a.au_fname	AS	"First Name"
	, SUM(s.qty)	AS 'Total Sales'
FROM 
	authors a
	INNER JOIN `titleauthor` ta ON a.au_id = ta.au_id
	INNER JOIN titles t ON ta.title_id = t.title_id
	INNER JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id
order by 4 DESC
LIMIT 3;


-- Challenge 4
/* Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). Also order your results based on TOTAL from high to low.*/

SELECT
	a.au_id 		AS 	"Author ID"
	, a.au_lname	AS	"Last Name"
	, a.au_fname	AS	"First Name"
	, COALESCE(SUM(s.qty), 0)	AS 'Total Sales'
FROM 
	authors a
	LEFT JOIN `titleauthor` ta ON a.au_id = ta.au_id
	LEFT JOIN titles t ON ta.title_id = t.title_id
	LEFT JOIN sales s ON t.title_id = s.title_id
GROUP BY a.au_id
order by 4 DESC;



	
	
	
