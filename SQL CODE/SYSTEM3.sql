select  owner, TABLE_NAME, CONSTRAINT_TYPE ,count(*) as count from 

all_constraints where owner in ('SP','BOOK','COMPANY','SPJ2','PUBCO','PROP2','IT','HR','IT4') 

group by owner, TABLE_NAME, CONSTRAINT_TYPE --order by CONSTRAINT_TYPE,owner  

UNION 

SELECT OWNER,TABLE_NAME,'ATTRIBUTES' ,COUNT(*) AS COUNT  FROM ALL_TAB_COLUMNS  

WHERE owner in ('SP','BOOK','COMPANY','SPJ2','PUBCO','PROP2','IT','HR','IT4') 

GROUP BY  OWNER,TABLE_NAME 

order by CONSTRAINT_TYPE,owner ;

