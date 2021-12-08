CREATE TABLE BOOK(Book_Id int NOT NULL, Title varchar(20), Language_Id int, MRP float(5), Publisher_Id int, Volume int, Status varchar(5), PRIMARY KEY(Book_Id), FOREIGN KEY(Language_Id)REFERENCES LANGUAGES(Language_Id),  FOREIGN KEY(Publisher_Id)REFERENCES PUBLISHER(Publisher_Id));

CREATE TABLE BOOK_AUTHOR(Book_Id int, Author_Id int);

CREATE TABLE BOOK_ISSUE(Issue_Id int NOT NULL,Date_of_Issue date, Book_Id int, Member_Id int,Expected_Date_of_Return date, Status varchar(5), PRIMARY KEY(Issue_Id), FOREIGN KEY(Book_Id) REFERENCES BOOK(Book_Id),  FOREIGN KEY(Member_Id) REFERENCES MEMBERS(Member_Id));

CREATE TABLE BOOK_RETURN(Issue_Id int NOT NULL,Actual_Date_of_Return date, LateDays int, LateFees int, PRIMARY KEY(Issue_Id), FOREIGN KEY(Issue_Id) REFERENCES BOOK_ISSUE(Issue_Id));

CREATE TABLE LATE_FEE_RULE(FromDays int, ToDays int,Amount float(7));

CREATE TABLE LANGUAGES(Language_Id int NOT NULL, Name varchar(20),PRIMARY KEY(Language_Id));

CREATE TABLE MEMBERS(Member_Id int NOT NULL, Name varchar(20), Branch_Code varchar(5), Roll_Number int, Phone_Number varchar(10), Email_ID varchar(25),Date_of_Join date, Status varchar(5),PRIMARY KEY(Member_Id));

CREATE TABLE PUBLISHER(Publisher_Id int NOT NULL, Name varchar(20), Address varchar(25), PRIMARY KEY(Publisher_Id));

CREATE TABLE AUTHOR(Author_Id int NOT NULL, Name varchar(20), Email varchar(25), Phone_Number varchar(10), Status varchar(5), PRIMARY KEY(Author_Id));
