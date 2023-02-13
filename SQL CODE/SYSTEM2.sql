select * from user_catalog where table_type='TABLE';

SELECT TABLE_NAME  
FROM ALL_TAB_COLUMNS  
WHERE OWNER = 'OOES';  
 
SELECT DISTINCT TABLE_NAME  
FROM ALL_TAB_COLUMNS  
WHERE OWNER = 'OOES';  
 
SELECT DISTINCT TABLE_NAME, COLUMN_NAME 
FROM ALL_TAB_COLUMNS  
WHERE OWNER = 'OOES'; 



SELECT * FROM USER_ROLE_PRIVS  
WHERE OWNER ='OOES'; 



SELECT AT.TABLE_NAME, AI.INDEX_NAME  
FROM ALL_TABLES AT, ALL_INDEXES AI  
WHERE AT.OWNER='SP'  
AND AT.TABLE_NAME= AI.TABLE_NAME;

Select count (*) from sp.sp

Select count (*) from sp.s



declare
    a_query varchar2(300);
    no_rec number(3);
begin
    for i in (select table_name, owner from all_tables where owner ='PUBCO')
    loop
    a_query:='select count(*) from '||' '||i.owner||'.'|| i.table_name;
    execute immediate (a_query) into no_rec;
    dbms_output.put_line(no_rec || ' ' || rpad(i.table_name,10));
    end loop;
end;



declare
    a_query varchar2(300);
    no_rec number(9);
begin
    dbms_output.put_line('owner Name' || ' ' || 'Table Name' || ' ' || 'No Records' );
    dbms_output.put_line('-------------' || ' ' || '----------' || ' ' || '-----------');
    for i in (select table_name, owner from all_tables where OWNER ='PUBCO')
    loop
    a_query:='select count(*) from '||' '||i.owner||'.'|| i.table_name;
    execute immediate (a_query) into no_rec;
    dbms_output.put_line(rpad(i.owner,10) || ' ' || lpad(i.table_name,10) || ' ' || (lpad(no_rec, 10)));
    end loop;
end;



Create or replace view All_USER_Owners
as
select distinct owner from all_tables 
where owner in 
(
'SP','PROP2', 'ZEOTA', 'BOOK', 'SPJ2', 'OOES',
'COMPANY',' PUBCO', 'OES21', 'IT4'
);


Select * from All_USER_Owners


declare
    a_query varchar2(300);
    no_rec number(9);
begin
    dbms_output.put_line('owner Name' || ' ' || 'Table Name' || ' ' || 'No Records' );
    dbms_output.put_line('-------------' || ' ' || '----------' || ' ' || '-----------');
 for j in select owner from All_USER_Owners
   for i in (select table_name,owner from all_tables where owner='SP')
    loop
      a_query:='select count(*) from '||'  '||i.owner||'.'||i.table_name;	
      execute immediate (a_query) into no_rec;
      dbms_output.put_line(rpad(i.owner,10) || ' ' || lpad(i.table_name,10) || ' ' || (lpad(no_rec, 10)) );
    end loop;

end;




for j in (select owner from All_USER_Owners
   for i in (select table_name,owner from all_tables where owner=‘SP')
    loop
      a_query:='select count(*) from '||'  '||i.owner||'.'||i.table_name;	
      execute immediate (a_query) into no_rec;
      dbms_output.put_line(rpad(i.owner,10) || ' ' || lpad(i.table_name,10) || ' ' || (lpad(no_rec, 10)) );
    end loop;





