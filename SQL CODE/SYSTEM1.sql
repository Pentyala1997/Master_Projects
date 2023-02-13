SELECT * from PUBCO.author
SELECT USERNAME FROM DBA_USERS
select table_name from all_tables where owner ='COMPANY'

create or replace PROCEDURE PROCEDURE3
(    
    db_name in VARCHAR2 
 ) 

  AS  
  
 CURSOR names_cur IS SELECT a.constraint_name, a.table_name FROM ALL_CONS_COLUMNS A JOIN ALL_CONSTRAINTS C   ON A.CONSTRAINT_NAME = C.CONSTRAINT_NAME WHERE  

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
END PROCEDURE3; 

// 
declare  
begin 
procedure3 ('COMPANY'); 
DBMS_OUTPUT.PUT_LINE('END'); 
end; 