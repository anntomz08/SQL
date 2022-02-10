
DECLARE
an INT; 
fac int;
FUNCTION fact(x int) RETURN int IS f int; 
BEGIN
IF x=0 THEN 
f :=1;
ELSE
f := x * fact(x-1); 
END IF; 
RETURN f;
END;
BEGIN
an:=:an;
FAC := FACT(AN);
dbms_output.put_line('Factorial of '|| an || ' is ' || fac);
END;

2.

CREATE TABLE student_details(ROLL INT,MARKS INT,PHONE INT);

INSERT INTO STUDENT_DETAILS VALUES(01,29,123456789);
