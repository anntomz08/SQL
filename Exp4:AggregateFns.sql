--Create a table named student. The table contains the marks of 10 students for 3 subjects(Physics, Chemistry, Mathematics).
--The total marks for physics and chemistry is 25. While for mathematics it is 50.The pass mark for physics and chemistry is 12 and for mathematics it is 25.
CREATE TABLE STUDENT(ROLL_NO int not null,NAME varchar(20),PHYSICS int,CHEMISTRY int,MATHS int,primary key(ROLL_NO));
ALTER TABLE STUDENT
ADD RESULT VARCHAR(5);
ALTER TABLE STUDENT 
ADD TOTALMARK INT;

INSERT INTO STUDENT VALUES(1,'ADAM',20,20,33);
INSERT INTO STUDENT VALUES(2,'BOB',18,9,41);
INSERT INTO STUDENT VALUES(3,'BRIGHT',22,7,31);
INSERT INTO STUDENT VALUES(4,'DUKE',13,21,20);
INSERT INTO STUDENT VALUES(5,'ELVIN',14,22,23);
INSERT INTO STUDENT VALUES(6,'FLETCHER',2,10,48);
INSERT INTO STUDENT VALUES(7,'GEORGINA',22,12,22);
INSERT INTO STUDENT VALUES(8,'MARY',24,14,31);
INSERT INTO STUDENT VALUES(9,'TOM',19,15,24);
INSERT INTO STUDENT VALUES(10,'ZACK',8,20,36);

UPDATE STUDENT
SET TOTALMARK=CHEMISTRY+MATHS+PHYSICS;

--A student is awarded a ‘Pass’ if he has passed all the subjects.
UPDATE STUDENT SET RESULT='PASS' WHERE CHEMISTRY>11 AND PHYSICS>11 AND MATHS>24;
UPDATE STUDENT
SET RESULT='FAIL'
WHERE MATHS<25 OR PHYSICS <12 OR CHEMISTRY<12;

--Find the class average for the subject ‘Physics’
SELECT AVG(PHYSICS) FROM STUDENT;

--Find the highest marks for mathematics (To be displayed as highest_marks_maths).
SELECT MAX(MATHS) AS highest_marks_maths FROM STUDENT; 

--Find the lowest marks for chemistry(To be displayed as lowest_mark_chemistry)
SELECT MIN(CHEMISTRY) AS lowest_marks_chemistry FROM STUDENT; 

--Find the total number of students who has got a ‘pass’ in physics.
SELECT COUNT(PHYSICS)
FROM STUDENT
WHERE PHYSICS>11; 

--Generate the list of students who have passed in all the subjects.
SELECT ROLL_NO,NAME
FROM STUDENT
WHERE RESULT='PASS'; 

--Generate a ranklist for the class. Indicate Pass/Fail. Ranking based on total marks obtained by the students.


--Find pass percentage of the class for mathematics
SELECT MAX((SELECT COUNT(MATHS) FROM STUDENT WHERE MATHS>24)/(SELECT COUNT(*) FROM STUDENT)*100)
FROM STUDENT;

--Find the overall pass percentage for all class.
SELECT MAX((SELECT COUNT(*) FROM STUDENT WHERE RESULT='PASS')/(SELECT COUNT(*) FROM STUDENT)*100)
FROM STUDENT;

--Find the class average.
SELECT AVG(TOTALMARK) FROM STUDENT;

--Find the total number of students who have got a Pass.
SELECT COUNT(*) FROM STUDENT WHERE RESULT='PASS';
