declare
    a_query varchar2(300);
    no_rec number(9);
begin
   dbms_output.put_line('owner Name' || ' ' || 'Table Name' || ' ' || 'No Records' );
   dbms_output.put_line('----------' || ' ' || '----------' || ' ' || '----------');
  for i in (select table_name, owner from all_tables where owner='OES')
    loop
      a_query:='select count(*) from '||'  '||i.owner||'.'||i.table_name;	
      execute immediate (a_query) into no_rec;
      dbms_output.put_line(rpad(i.owner,10) || ' ' || lpad(i.table_name,10) || ' ' || (lpad(no_rec, 10)) );
    end loop;
end;
