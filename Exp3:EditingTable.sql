INSERT INTO BOOK VALUES(421,'Database',12,300,598,1,'YES');
INSERT INTO BOOK VALUES(425,'Operating system',12,341,598,1,'YES');
INSERT INTO BOOK VALUES(415,'Data structures',12,250,598,1,'NO');
INSERT INTO BOOK VALUES(115,'Computer network',12,250,598,1,'NO');
INSERT INTO BOOK VALUES(578,'Computer System A',12,220,598,1,'NO');
INSERT INTO BOOK VALUES(508,'Computer programming',12,290,598,1,'YES');

--Find the names of all title starting on the alphabet ‘D’
SELECT * FROM BOOK WHERE title LIKE 'D%';

--List the names of all titles containing the substring ‘ Computer’
SELECT * FROM BOOK WHERE title LIKE '% Computer%';

--List all the title in Upper Case Format
SELECT UPPER(title) FROM BOOK;

--List the titles starting on ‘D’ , 3rd letter is ‘t’ and contains the substring “struct‘’
SELECT * FROM BOOK WHERE title LIKE '%D%t%struct%';

--List the title of all books ending on the alphabet ‘e’
SELECT * FROM BOOK WHERE title LIKE '%e';

--List all the title in reverse
SELECT REVERSE(title) FROM BOOK;
