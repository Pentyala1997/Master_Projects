ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;
create user PROP2 IDENTIFIED BY oracle;
GRANT ALL PRIVILEGES TO PROP2

select * from staff

select table_name from all_tables where owner='DATA_ANALYTICS'


ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;
create user COMPANY IDENTIFIED BY oracle;
GRANT ALL PRIVILEGES TO COMPANY

ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;
create user PROP IDENTIFIED BY oracle;
GRANT ALL PRIVILEGES TO PROP

ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;
create user ZEOTA IDENTIFIED BY oracle;
GRANT ALL PRIVILEGES TO ZEOTA
 

ALTER SESSION SET "_ORACLE_SCRIPT"= TRUE;
create user SP IDENTIFIED BY oracle;
GRANT ALL PRIVILEGES TO SP
  
 
 
 DROP USER ZEOTA
 
 
 
 
 
 
 create or replace PROCEDURE PROCEDURE1 
(   
    db_name in VARCHAR2
    )

AS 

CURSOR names_cur IS SELECT table_name from all_tables where owner = db_name;

    TYPE names_ntt IS TABLE OF names_cur%rowTYPE index by binary_integer;
    l_names  names_ntt;
BEGIN
    OPEN  names_cur;
    FETCH names_cur BULK COLLECT INTO l_names;
    DBMS_OUTPUT.PUT_LINE('record count' || l_names.count);
    for indx in 1..l_names.count loop
    DBMS_OUTPUT.PUT_LINE(l_names(indx).TABLE_NAME);
    end loop;
    CLOSE names_cur;

END PROCEDURE1;

//
declare 
begin
procedure1 ('OES');
DBMS_OUTPUT.PUT_LINE('end of tables');
end;





create or replace PROCEDURE PROCEDURE2
(   
    db_name in VARCHAR2
   
    )

AS 

CURSOR names_cur IS SELECT a.constraint_name, a.table_name FROM ALL_CONS_COLUMNS A JOIN ALL_CONSTRAINTS C  
ON A.CONSTRAINT_NAME = C.CONSTRAINT_NAME WHERE 
 C.CONSTRAINT_TYPE = 'P' AND A.OWNER=db_name;
 
   
    TYPE names_ntt IS TABLE OF names_cur%rowTYPE index by binary_integer;
    l_names  names_ntt;
BEGIN
    OPEN  names_cur;
    FETCH names_cur BULK COLLECT INTO l_names;
    DBMS_OUTPUT.PUT_LINE('record count' || l_names.count);
    for indx in 1..l_names.count loop
    DBMS_OUTPUT.PUT_LINE('Table Name:'|| l_names (indx).table_name||' AND Constraint Name:'||l_names (indx).constraint_name);
    end loop;
    CLOSE names_cur;

END PROCEDURE2;

//
declare 
begin
procedure2 ('SP');
DBMS_OUTPUT.PUT_LINE('END');
end;









SELECT * FROM ALL_CONS_COLUMNS A JOIN ALL_CONSTRAINTS C  
ON A.CONSTRAINT_NAME = C.CONSTRAINT_NAME WHERE 
 C.CONSTRAINT_TYPE = 'C' AND A.OWNER='ZEOTA'
  

SELECT * FROM ALL_CONS_COLUMNS A 

SELECT 








create or replace PROCEDURE PROCEDURE3
(   
    db_name in VARCHAR2
   
    )

AS 

CURSOR names_cur IS SELECT a.constraint_name, a.table_name FROM ALL_CONS_COLUMNS A JOIN ALL_CONSTRAINTS C  
ON A.CONSTRAINT_NAME = C.CONSTRAINT_NAME WHERE 
 C.CONSTRAINT_TYPE = 'C' AND A.OWNER=db_name;
 
   
    TYPE names_ntt IS TABLE OF names_cur%rowTYPE index by binary_integer;
    l_names  names_ntt;
BEGIN
    OPEN  names_cur;
    FETCH names_cur BULK COLLECT INTO l_names;
    DBMS_OUTPUT.PUT_LINE('record count' || l_names.count);
    for indx in 1..l_names.count loop
    DBMS_OUTPUT.PUT_LINE('Table Name:'|| l_names (indx).table_name||' AND Constraint Name:'||l_names (indx).constraint_name);
    end loop;
    CLOSE names_cur;

END PROCEDURE3;

//
declare 
begin
procedure3 ('SPJ');
DBMS_OUTPUT.PUT_LINE('END');
end;















