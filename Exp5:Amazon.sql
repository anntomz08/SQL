CREATE TABLE ITEM(ITEMID INT NOT NULL,ITEMNAME VARCHAR(50),CATEGORY VARCHAR(20),PRICE INT,INSTOCK INT, PRIMARY KEY(ITEMID));
CREATE TABLE CUSTOMERS(CUSTID INT NOT NULL,CUSTNAME VARCHAR(50),ADDRESS VARCHAR(20),STATE VARCHAR(20), PRIMARY KEY(CUSTID));
CREATE TABLE ORDERS(ORDERID INT NOT NULL,ITEMID INT,CUSTID INT,QUANTIY INT,ORDERDATE DATE,PRIMARY KEY(ORDERID),FOREIGN KEY(ITEMID)REFERENCES ITEM(ITEMID),FOREIGN KEY(CUSTID)REFERENCES CUSTOMERS(CUSTID));
CREATE TABLE DELIVERY(DELIVERYID INT NOT NULL,ORDERID INT,CUSTID INT,PRIMARY KEY(DELIVERYID),FOREIGN KEY(ORDERID)REFERENCES ORDER(ORDERID),FOREIGN KEY(CUSTID)REFERENCES CUSTOMERS(CUSTID));

insert into item values(1,'batman','toys',10,2);
insert into item values(2,'laptop','electronics',699,5); 
insert into item values(3,'galaxy s4','electronics',500,15); 
insert into item values(4,'helmet','vehicles',111,20); 
insert into item values(5,'sony z5 premium','electronics',5005,1); 

insert into customers values(111,'elvin','202 jai street','delhi'); 
insert into customers values(112,'patrick','street 1 harinagar','chennai');
insert into customers values(113,'soman','puthumana p.o','kerala');
insert into customers values(114,'jaise','kottarakara','kerala'); 
insert into customers values(115,'mickey','juhu','mumbai'); 

insert into orders values(911,1,111,2,'11-oct-2014');
insert into orders values(912,3,113,4,'29-jan-2012'); 
insert into orders values(913,5,115,1,'16-may-2013'); 
insert into orders values(914,4,114,3,'22-dec-2014'); 

insert into delivery values(667,914,115);
insert into delivery values(669,911,111); 
insert into delivery values(670,912,113); 

--List the details of all customers who have placed an order
SELECT * FROM CUSTOMERS INNER JOIN ORDERS ON ORDERS.CUSTID=CUSTOMERS.CUSTID;

--List the details of all customers whose orders have been delivered
SELECT * FROM CUSTOMERS INNER JOIN ORDERS ON ORDERS.CUSTID=CUSTOMERS.CUSTID INNER JOIN DELIVERY ON DELIVERY.CUSTID=CUSTOMERS.CUSTID;

--Find the order date for all customers whose name starts in the letter‘J’
SELECT ORDERS.ORDERDATE FROM ORDERS JOIN CUSTOMERS ON ORDERS.CUSTID=CUSTOMERS.CUSTID WHERE CUSTOMERS.CUSTNAME LIKE 'j%';

--Display the name and price of all items bought by the customer‘Mickey’
SELECT ITEM.ITEMNAME,ITEM.PRICE FROM ITEM INNER JOIN ORDERS ON ITEM.ITEMID=ORDERS.ITEMID INNER JOIN CUSTOMERS ON ORDERS.CUSTID=CUSTOMERS.CUSTID WHERE CUSTOMERS.CUSTNAME LIKE '%mickey%';

--List the details of all customers who have placed an order after January 2013 and not received delivery of items
SELECT * FROM CUSTOMERS INNER JOIN ORDERS ON CUSTOMERS.CUSTID=ORDERS.CUSTID INNER JOIN delivery ON delivery.CUSTID=CUSTOMERS.CUSTID WHERE orders.orderdate >'01-jan-2013';

--Find the itemid of items which has either been ordered or not delivered.
SELECT ITEM.ITEMID FROM ITEM JOIN ORDERS ON ORDERS.ITEMID = ITEM.ITEMID MINUS (SELECT ITEM.ITEMID FROM ITEM JOIN ORDERS ON ORDERS.ITEMID = ITEM.ITEMID JOIN DELIVERY ON DELIVERY.ORDERID=ORDERS.ORDERID);

--Find the name of all customers who have placed an order and have their orders
SELECT CUSTOMERS.CUSTNAME FROM CUSTOMERS INNER JOIN ORDERS ON ORDERS.CUSTID=CUSTOMERS.CUSTID INNER JOIN DELIVERY ON DELIVERY.CUSTID=CUSTOMERS.CUSTID;

--Find the custname of all customers who have placed an order but not having their orders delivered. 
SELECT CUSTOMERS.CUSTNAME FROM CUSTOMERS JOIN ORDERS ON CUSTOMERS.CUSTID=ORDERS.CUSTID MINUS (SELECT CUSTOMERS.CUSTNAME FROM CUSTOMERS JOIN ORDERS ON CUSTOMERS.CUSTID=ORDERS.CUSTID JOIN DELIVERY ON DELIVERY.CUSTID=ORDERS.CUSTID); 

--Find the name of the customer who has placed the most number of orders.
SELECT CUSTOMERS.CUSTNAME FROM CUSTOMERS INNER JOIN ORDERS ON ORDERS.CUSTID=CUSTOMERS.CUSTID WHERE ORDERS.QUANTIY=(SELECT MAX(ORDERS.QUANTIY) FROM ORDERS);

--Find the details of all customers who have purchased items exceeding a price of 5000$
SELECT * FROM CUSTOMERS INNER JOIN ORDERS ON ORDERS.CUSTID=CUSTOMERS.CUSTID JOIN ITEM ON ITEM.ITEMID=ORDERS.ITEMID WHERE ITEM.PRICE >5000;

--Find the name and address of customers who has not ordered a ‘Samsung GalaxyS4’
SELECT CUSTOMERS.CUSTNAME,CUSTOMERS.ADDRESS FROM CUSTOMERS INNER JOIN ORDERS ON ORDERS.CUSTID=CUSTOMERS.CUSTID JOIN ITEM ON ITEM.ITEMID=ORDERS.ITEMID WHERE ITEM.ITEMNAME NOT LIKE '%Samsung GalaxyS4%';

--Perform Left Outer Join and Right Outer Join on Customers & Orders Table.
SELECT * FROM CUSTOMERS RIGHT JOIN ORDERS ON CUSTOMERS.CUSTID=ORDERS.CUSTID;
SELECT * FROM CUSTOMERS LEFT JOIN ORDERS ON CUSTOMERS.CUSTID=ORDERS.CUSTID;

--Find the details of all customers grouped by state
SELECT * FROM CUSTOMERS ORDER BY STATE;

--Display the details of all items grouped by category and having a price greater than average price of allitems.
SELECT * FROM ITEM WHERE PRICE >(SELECT AVG(PRICE)FROM ITEM) ORDER BY CATEGORY;
