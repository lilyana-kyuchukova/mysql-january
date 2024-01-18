CREATE DATABASE book_library;
USE book_library;

CREATE TABLE authors (
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(30) NOT NULL,
	middle_name VARCHAR(30),
	last_name VARCHAR(30) NOT NULL,
	born DATETIME NOT NULL,
	died DATETIME
);

INSERT INTO authors(id,first_name, middle_name, last_name, born, died) VALUES
	(1,'Agatha', 'Mary Clarissa','Christie', '1890-09-15', '1976-01-12'),
	(2,'William', NULL,'Shakespeare', '1564-04-26', '1616-04-23'),
	(3,'Danielle', 'Fernandes Dominique', 'Schuelein-Steel', '1947-07-14', NULL),
	(4,'Joanne', NULL,'Rowling' , '1965-07-31', NULL),
	(5,'Lev', 'Nikolayevich', 'Tolstoy', '1828-09-09', '1910-11-20'),
	(6,'Paulo', 'Coelho de', 'Souza', '1947-08-24', NULL),
	(7,'Stephen', 'Edwin', 'King', '1947-09-21', NULL),
	(8,'John', 'Ronald Reuel', 'Tolkien', '1892-01-03', '1973-09-02'),
	(9,'Erika', NULL, 'Mitchell', '1963-03-07', NULL);
	
CREATE TABLE books (
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
	author_id INT NOT NULL,
	year_of_release DATE,
	cost DOUBLE NOT NULL,
	CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES authors(id)
);

INSERT INTO books(author_id,title, year_of_release,cost) VALUES
	(1,'Unfinished Portrait', '1930-01-29', 15.99),
	(1,'The Mysterious Affair at Styles', '1920-12-31',17.99),
	(1,'The Big Four', '1927-12-12',14.99),
	(1,'The Murder at the Vicarage', '1930-12-22',13.99),
	(1,'The Mystery of the Blue Train', '1928-11-11',12.99),
	(2,'Julius Caesar', '1599-11-13',11.99),
	(2,'Timon of Athens', '1607-11-23',13.99),
	(2,'As You Like It', '1600-04-04',18.99),
	(2,'A Midsummer Night\'s Dream', '1595-03-03',15.99),
	(3,'Going Home', '1973-05-06',15.99),
	(3,'The Ring', '1980-06-06',14.99),
	(3,'Secrets', '1985-08-16',15.99),
	(3,'Message From Nam', '1990-09-11',13.99),
	(4,'Career of Evil', '2015-12-12',15.99),
	(4, 'Harry Potter and the Philosopher\'s Stone','1997-11-14',19.99),
	(4,'Harry Potter and the Chamber of Secrets','1998-12-15',19.99),
	(4,'Harry Potter and the Prisoner of Azkaban','1999-01-10',19.99),
	(4,'Harry Potter and the Goblet of Fire','2000-10-01',19.99),
	(4,'Harry Potter and the Order of the Phoenix','2003-03-11',19.99),
	(4,'Harry Potter and the Half-Blood Prince','2005-05-04',19.99),
	(4,'Harry Potter and the Deathly Hallows','2007-07-17',19.99),
	(4,'Harry Potter and the Deathly Hallows','2007-11-13',15.99),
	(5,'Anna Karenina','1877-11-11',15.99),
	(5,'War And Peace','1869-10-26',30),
	(5,'Boyhood','1854-09-09',15.99),
	(6,'By the River Piedra I Sat Down and Wept','1994-12-11',15.99),
	(6,'The Alchemist','1988-08-08',15.99),
	(6,'The Fifth Mountain','1996-09-17',15.99),
	(6,'The Zahir','2005-10-11',15.99),
	(7,'Rage','1977-09-09',13.99),
	(7,'The Dead Zone','1979-09-07',13.99),
	(7,'It','1986-12-11',13.99),
	(7,'It','1986-11-14',13.99),	
	(8,'The Hobbit','1937-06-12',20.99),	
	(8,'The Adventures of Tom Bombadil','1962-05-04',13.99),	
	(9,'Fifty Shades of Grey','2011-06-07',13.99),	
	(9,'Fifty Shades Darker','2012-08-12',13.99),	
	(9,'Fifty Shades Freed','2012-11-19',13.99);
    
-- SUBSTRING()
SELECT SUBSTRING("SOME TEXT", 1); -- from idx to end
SELECT SUBSTRING("SOME TEXT", -4); -- returns TEXT
SELECT SUBSTRING("SOME TEXT" FROM 4 FOR 5); -- returns E TEX
SELECT SUBSTR("SOME TEXT", 4, 5); -- same as above
SELECT SUBSTR("SOME TEXT", 1, 4); -- returns SOME

SELECT CONCAT(SUBSTR(title, 1, 20), "...")
FROM books;


-- 1.Find Book Titles
SELECT title FROM books
WHERE title LIKE "The %";

SELECT title FROM books
WHERE SUBSTRING(title, 1, 4) = "The ";

-- REPLACE()
SELECT REPLACE("TEXT", "T", "t"); -- returns tEXt
SELECT REPLACE(REPLACE("TEXT", "T", "t"), "E", "e"); -- returns teXt

-- 2.Replace Titles
SELECT REPLACE(title, "The", "***") AS "title"
FROM books
WHERE SUBSTRING(title, 1, 4) = "The ";

-- LTRIM() RTRIM() TRIM()
SELECT LTRIM("    TEXT"); -- removed whitespaces, new lines, tabs, all
SELECT RTRIM("TEXT			");
SELECT LTRIM(RTRIM("   ALABALA   "));

SELECT TRIM("   ALABALA   ");
SELECT TRIM(LEADING "X" FROM "XXBARXX"); -- returns BARXX
SELECT TRIM(BOTH "X" FROM "XXBARX"); -- returns BAR
SELECT TRIM(TRAILING "X" FROM "XXBARX"); -- returns XXBAR

-- CHAR_LENGTH() LENGTH()
SET @name := "лили";

SELECT CHAR_LENGTH(@name), LENGTH(@name); -- returns 4 symbols and 8 as more bytes to record

-- LEFT() RIGHT()
SELECT LEFT("SOME TEXT", 4); -- returns SOME
SELECT RIGHT("SOME TEXT", 4); -- returns TEXT

-- LOWER() UPPER()
SELECT LOWER("Some Text"), UPPER("Some Text");

-- REVERSE()
SELECT REVERSE("HELLO");

-- REPEAT()
SELECT REPEAT("W", 3);

-- LOCATE() returns inx position
SELECT LOCATE("BAR", "SOME BAR"); -- returns 6

SELECT * FROM books
WHERE LOCATE(" The ", title, 3) = 0; -- returns titles where no the is present

SELECT * FROM books
WHERE LOCATE(" The ", title, 3) > 0; 

-- INSERT()
SELECT INSERT("MY NAME", 7, 14, " IS LILLY");
SELECT INSERT("MU, NAME", 2, 1, "Y"); -- replaces the U with Y, so replaces more than inserts

-- DIV and /
SELECT 7 DIV 2, 7 / 2; -- DIV is integer division will return 3, not 3.5

-- MOD and %
SELECT 7 MOD 2, 7 % 2; -- returns the same as they are equal unlike div and /

SELECT 8 MOD 2 = 0;

-- PI()
SELECT PI()+0.00;

-- ABS()
SELECT ABS(-10);

-- SQRT()
SELECT SQRT(16);

-- POW() / POWER()
SELECT POW(2, 4) ; -- 2 ^ 4
SELECT POWER(2, 5);

-- CONV()
SELECT CONV(14, 10, 2); -- returns 1110 from decimal to binary
SELECT CONV("A", 16, 10); -- 10 from hex to dec 

-- ROUND() FLOOR() CEIL() / CEILING()
SELECT ROUND(1.34); -- 1
SELECT ROUND(1.455, 2); -- 1.46
SELECT ROUND(1.56); -- 2
SELECT ROUND(-34.877, 2); -- -34.88
SELECT ROUND(11.455, -1); -- 10

SELECT FLOOR(1.23), FLOOR(-1.23); -- 1 and - 2, the closest smaller number
SELECT CEILING(1.23), CEIL(-1.23); -- 2 and -1 the closes bigger num

SELECT SIGN(7), SIGN(0), SIGN(-1);

-- RAND()
-- SELECT FLOOR(RAND() * (MAX - MIN)) + MIN to create a range
SELECT RAND(); -- random value vetween [0,1] NO SEED meaning random nums
SELECT RAND(3);  -- with seed the same num

SELECT FLOOR(RAND() * 14) + 13; -- [13, 27]

-- 3.Sum Cost of All Books
SELECT TRUNCATE(SUM(cost), 2) FROM books;

-- Date Functions
-- https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html
-- EXTRACT()
SELECT EXTRACT(YEAR FROM '2019-07-02'); -- 2019
SELECT EXTRACT(YEAR_MONTH FROM '2019-07-02 01:02:03'); -- 201907
SELECT EXTRACT(MICROSECOND FROM '2003-01-02 10:30:00.000123'); -- 123

SELECT title, EXTRACT(YEAR FROM year_of_release) FROM books;

-- TIMESTAMPDIFF()
-- 4.Days Lived
SELECT 
	CONCAT_WS(" ", first_name, last_name) AS "Full Name", 	
    TIMESTAMPDIFF(DAY, born, died) AS "Days Lived",
    ABS(TIMESTAMPDIFF(DAY, died, born)) AS "Days Lived ABS"
FROM authors;

SELECT YEAR("2024-01-02"), EXTRACT(YEAR FROM "2024-01-02");
SELECT DAY("2024-01-02"), EXTRACT(DAY FROM "2024-01-02");

-- DATE_FORMAT()
SELECT title, 
	DATE_FORMAT(year_of_release, "%Y/%c/%e"),
	DATE_FORMAT(year_of_release, "%y-%m-%d"),
	DATE_FORMAT(year_of_release, "%Y %b %D"),
	DATE_FORMAT(year_of_release, "%Y %M %D")
FROM books;

SELECT DATE_FORMAT(NOW(), "%Y %b %D");

-- 5.Harry Potter Books
SELECT title
FROM books
WHERE title LIKE "Harry Potter%"
ORDER BY id;

SELECT title, COUNT(title) AS "COUNT" FROM books
WHERE title = 'Harry Potter and the Deathly Hallows';

SELECT title FROM books
WHERE title LIKE "H%S";

SELECT title FROM books
WHERE title LIKE "% THE%";

SELECT title
FROM books
WHERE title REGEXP "^Harry Potter"
ORDER BY id;
