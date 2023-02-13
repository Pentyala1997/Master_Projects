create or replace PROCEDURE usecase14_2  AS
--  
    CURSOR c_roles IS
    SELECT *  FROM dba_roles
        where 1=1      
        and ROWNUM < 50;

BEGIN
       --
    dbms_output.put_line('        Report Headers     ');
    dbms_output.put_line('===================== ');
    dbms_output.put_line('Role Name   ');
    dbms_output.put_line('===================== ');
                                 --
    FOR i IN c_roles LOOP
        --
        dbms_output.put_line(i.role
                             );
    END LOOP;

EXCEPTION
--
    WHEN OTHERS THEN
--
        dbms_output.put_line('Erroroccur while printing details and msg is:' || sqlerrm);
 --
END usecase14_2;