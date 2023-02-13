CREATE TABLE branch
(branchno VARCHAR2(5)
 ,street VARCHAR(100)
 ,city  VARCHAR2(20)
 ,postcode varchar2(10)
 ,PRIMARY KEY (branchno)
)
/

CREATE TABLE client
(clientno VARCHAR2(5)
 ,fname VARCHAR(8)
 ,lname  VARCHAR(8)
 ,address varchar2(35)
 ,tel_no varchar2(14)
 ,pref_type char(6)
 ,max_rent number(4)
 ,PRIMARY KEY (clientno)
)
/

create table viewing
( clientno VARCHAR2(5)
 ,propertyno varchar2(5)
 ,viewdate date
 ,comments varchar2(200)
 ,PRIMARY KEY (clientno, propertyno)
)
/

CREATE TABLE private_owner
(ownerno VARCHAR2(4)
 ,fname VARCHAR2(20)
 ,lname  VARCHAR(20)
 ,address varchar2(50)
 ,tel_no varchar2(14)
 ,PRIMARY KEY (ownerno)
)
/

create table registration
( clientno VARCHAR2(5)
 ,branchno varchar2(5)
 ,staffno varchar2(5)
 ,datejoined date
 ,PRIMARY KEY (clientno, branchno, staffno)
)
/

CREATE TABLE staff
(staffno VARCHAR2(5)
 ,fname VARCHAR(15)
 ,lname VARCHAR(15)
 ,position varchar2(15)
 ,sex char(1)
 ,dob date
 ,salary number(7,2)
 ,branchno varchar2(5)
 ,FOREIGN KEY(branchno) REFERENCES branch(branchno)
 ,PRIMARY KEY (staffno)
)
/

CREATE TABLE property_for_rent
(propertyno VARCHAR2(5)
 ,street VARCHAR(15)
 ,city  VARCHAR(10)
 ,postcode varchar2(6)
 ,type char(7)
 ,rooms number(2)
 ,rent number(4) 
 ,ownerno varchar2(4)
 ,branchno varchar2(5)
 ,staffno varchar(4)
 ,FOREIGN KEY(branchno) REFERENCES branch(branchno)
 ,PRIMARY KEY (propertyno)
)
/

create table lease
( lease_no varchar2(6) 
,property_no varchar2(4)
,client_no varchar2(4)
,rent number(4)
,payment_method char(7)
,deposit number(6)
,paid  char(1)
,rent_start date
,rent_finish  date
,duratn number)
/

grant select on branch to public;
grant select on client to public;
grant select on staff to public;
grant select on viewing to public;
grant select on property_for_rent to public;
grant select on registration to public;
grant select on private_owner to public;
grant select on lease to public;


INSERT INTO BRANCH VALUES ('B008', '12 Paul St', 'Preston', 'PR30JB');
INSERT INTO BRANCH VALUES ('B009', '32 Elizabeth St', 'Burmingham', 'BB17JE');
INSERT INTO BRANCH VALUES ('B010', '24 Koleen Dr', 'Manchester', 'KM41SA');

INSERT INTO STAFF VALUES ('SA5', 'Mark', 'Smith', 'Assistant', 'M', '23-Nov-1974', 10000, 'B008');
INSERT INTO STAFF VALUES ('SA10', 'Brian', 'Sothe', 'Supervisor', 'M', '30-DEC-1964', 17000, 'B008');
INSERT INTO STAFF VALUES ('SL51', 'Maria', 'Brian', 'Assistant', 'F', '15-Oct-1976', 13000, 'B009');
INSERT INTO STAFF VALUES ('SL61', 'Sheela', 'Johnson', 'Manager', 'F', '20-FEB-1969', 33000, 'B009');
INSERT INTO STAFF VALUES ('SA8', 'Jake', 'Austin', 'Assistant', 'M', '03-JAN-1979', 9000, 'B009');
INSERT INTO STAFF VALUES ('SG15', 'Angila', 'Joleen', 'Assistant', 'F', '23-Sep-1976', 12000, 'B010');
INSERT INTO STAFF VALUES ('SG16', 'Fredo   ', 'Satin ', 'Supervisor', 'M', '13-APR-1973', 16000, 'B010');
INSERT INTO STAFF VALUES ('SG17', 'Gyneth', 'Paltrow', 'Assistant', 'F', '07-JAN-1980', 11000, 'B010');

INSERT INTO PRIVATE_OWNER VALUES ('CO51', 'Blair', 'Steven', '2 Style Dr London JZ43KL', '0181-750-2551');
INSERT INTO PRIVATE_OWNER VALUES ('CO63', 'Karen', 'Salem', '14 Janet St Bristol BR43KL', '0121-750-6513');
INSERT INTO PRIVATE_OWNER VALUES ('CO64', 'Teetz', 'Allen', '2 Lookup Dr Manchester GA43', '0131-730-4002');
INSERT INTO PRIVATE_OWNER VALUES('CO65', 'Leon', 'Russel', '15 Cicero St Bristol BR21UT', '0121-631-6262');
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG15', '11 Aragon', 'Manchester', 'SA32DC', 'House', 4, 700, 'CO51', 'SG17','B008'); 
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG59', '25 River Dr', 'London', 'YZ32DC', 'House', 8, 1400, 'CO63', 'SA10','B009'); 
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG58', '65 Lori St', 'Burmingham', 'BR22DZ', 'Flat', 3, 500, 'CO63', 'SL51','B010'); 
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG57', '10 Hamilton DR', 'Manchester', 'LO32VC', 'Flat', 5, 700, 'CO64', 'SL61','B008'); 
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG56', '1 Jackson Ht', 'Manchester', 'MA32DC', 'House', 6, 1200, 'CO51', 'SA81','B009'); 
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG71', '23 Lori St', 'Burmingham', 'BR22DZ', 'Flat', 3, 500, 'CO63', 'SL51','B010'); 
-- INSERT INTO PROPERTY_FOR_RENT VALUES ('PG72', '69 Julius St', 'Burmingham', 'BR26DZ', 'Flat', 4, 800, 'CO46','B007', 'SG5'); 
-- INSERT INTO PROPERTY_FOR_RENT VALUES ('PG73', '102 Bernard St', 'Burmingham', 'BR26DX', 'House', 10, 2100, 'CO40','B04', 'SL41'); 
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG74', '304 Michelle St', 'Burmingham', 'BR29ZS', 'House', 3, 600, 'CO51', 'SL51','B010'); 
-- INSERT INTO PROPERTY_FOR_RENT VALUES ('PG75', '98 South Dr', 'London', 'JZ32DC', 'House', 5, 1000, 'CO61', 'SL21','B010'); 
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG76', '7 Dracula St', 'London', 'OP32DC', 'Flat', 3, 400, 'CO64', 'SA8','B008'); 
-- INSERT INTO PROPERTY_FOR_RENT VALUES ('PG77', '25 Harbor Dr', 'Bristol', 'YZ32DC', 'Flat', 2, 350, 'CO93', 'SG16','B009'); 
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG78', '9 Thames Dr', 'London', 'JA32DC', 'House', 4, 700, 'CO64', 'SG17','B010'); 

drop table property_for_rent

CREATE TABLE property_for_rent
(propertyno VARCHAR2(5)
 ,street VARCHAR(15)
 ,city  VARCHAR(10)
 ,postcode varchar2(6)
 ,type char(7)
 ,rooms number(2)
 ,rent number(4) 
 ,ownerno varchar2(4)
 ,staffno varchar(4)
 ,branchno varchar2(5)
 ,FOREIGN KEY(branchno) REFERENCES branch(branchno)
 ,PRIMARY KEY (propertyno)
)

INSERT INTO LEASE VALUES ( 10080  ,'PG4'  ,'CR80' , 300  ,'Visa' , 800   ,'Y'  ,'01-JAN-1980'  ,'31-MAR-1985'  , NULL );
INSERT INTO LEASE VALUES ( 10081  ,'PG4'  ,'CR56' , 325  ,'Master' , 850   ,'Y'  ,'01-APR-1985'  ,'30-MAY-1993'  , NULL );
INSERT INTO LEASE VALUES ( 10082  ,'PG4'  ,'CR76' , 350  ,'Cash' , 900   ,'Y'  ,'01-JUL-1995'  ,'31-DEC-2000'  , NULL );
INSERT INTO LEASE VALUES ( 10083  ,'PG4'  ,'CR82' , 350  ,'Cheque' , 700   ,'Y'  ,'15-FEB-01'  ,'30-JAN-03'  , NULL );
INSERT INTO LEASE VALUES ( 10084  ,'PG77'  ,'CR80' , 350  ,'Visa' , 700   ,'Y'  ,'01-APR-1985'  ,'31-DEC-00'  , NULL );
INSERT INTO LEASE VALUES ( 10085  ,'PG77'  ,'CR76' , 350  ,'Master' , 800   ,'Y'  ,'01-JAN-01'  ,'15-FEB-03'  , NULL );
INSERT INTO LEASE VALUES ( 10086  ,'PG36'  ,'CR56' , 375  ,'Cash' , 1000   ,'Y'  ,'01-JUN-1993'  ,'28-FEB-03'  , NULL );
INSERT INTO LEASE VALUES ( 10087  ,'PG76'  ,'CR78' , 400  ,'Cheque' , 800   ,'Y'  ,'02-MAR-1995'  ,'31-OCT-1999'  , NULL );
INSERT INTO LEASE VALUES ( 10088  ,'PG76'  ,'CR83' , 400  ,'Master' , 800   ,'Y'  ,'01-NOV-1999'  ,'30-SEP-02'  , NULL );
INSERT INTO LEASE VALUES ( 10089  ,'PG76'  ,'CR62' , 400  ,'Visa' , 900   ,'Y'  ,'01-OCT-02'  ,'31-JAN-03'  , NULL );
INSERT INTO LEASE VALUES ( 10090  ,'PG16'  ,'CR78' , 400  ,'Cheque' , 800   ,'Y'  ,'01-OCT-1999'  ,'29-SEP-02'  , NULL );
INSERT INTO LEASE VALUES ( 10091  ,'PG58'  ,'CR83' , 500  ,'Cash' , 900   ,'Y'  ,'15-OCT-02'  ,'15-JAN-03'  , NULL );
INSERT INTO LEASE VALUES ( 10092  ,'PG71'  ,'CR62' , 500  ,'Cash' , 900   ,'N'  ,'01-JAN-02'  ,'31-DEC-03'  , NULL );
INSERT INTO LEASE VALUES ( 10093  ,'PG74'  ,'CR79' , 600  ,'Master' , 1200   ,'Y'  ,'01-JAN-1998'  ,'30-SEP-1999'  , NULL );
INSERT INTO LEASE VALUES ( 10094  ,'PG74'  ,'CR74' , 600  ,'Cheque' , 1200   ,'N'  ,'01-OCT-1999'  ,'30-MAR-03'  , NULL );
INSERT INTO LEASE VALUES ( 10095  ,'PG15'  ,'CR84' , 700  ,'Cheque' , 1400   ,'Y'  ,'15-APR-1995'  ,'15-MAR-03'  , NULL );
INSERT INTO LEASE VALUES ( 10096  ,'PG57'  ,'CR81' , 750  ,'Visa' , 1500   ,'Y'  ,'01-JAN-1996'  ,'30-MAY-01'  , NULL );
INSERT INTO LEASE VALUES ( 10097  ,'PG72'  ,'CR81' , 800  ,'Visa' , 1500   ,'Y'  ,'01-JUN-01'  ,'30-JUN-03'  , NULL );
INSERT INTO LEASE VALUES ( 10098  ,'PG75'  ,'CR87' , 1000  ,'Cash' , 2000   ,'Y'  ,'01-APR-1999'  ,'30-OCT-01'  , NULL );
INSERT INTO LEASE VALUES ( 10099  ,'PG75'  ,'CR85' , 1000  ,'Visa' , 2000   ,'Y'  ,'01-NOV-01'  ,'30-MAY-02'  , NULL );
INSERT INTO LEASE VALUES ( 10100  ,'PG56'  ,'CR87' , 1200  ,'Cash' , 2400   ,'N'  ,'01-DEC-01'  ,'28-FEB-03'  , NULL );
INSERT INTO LEASE VALUES ( 10101  ,'PG59'  ,'CR86' , 1400  ,'Visa' , 3000   ,'Y'  ,'01-NOV-1997'  ,'30-NOV-01'  , NULL );
INSERT INTO LEASE VALUES ( 10102  ,'PG73'  ,'CR85' , 2100  ,'Cash' , 4000   ,'N'  ,'01-JUN-02'  ,'30-SEP-02'  , NULL );
INSERT INTO VIEWING VALUES  ('CR80' ,'PG4' ,'01-DEC-1979' ,'It is good')  ;
INSERT INTO VIEWING VALUES  ('CR56' ,'PG4' ,'01-FEB-1985' ,'We will go for it')  ;
INSERT INTO VIEWING VALUES  ('CR76' ,'PG4' ,'01-JUN-1995' , 'Can you change the color')  ;
INSERT INTO VIEWING VALUES  ('CR82' ,'PG4' ,'15-JAN-01' , 'I like the kitchen the most')  ;
INSERT INTO VIEWING VALUES  ('CR80' ,'PG77' ,'01-JAN-1985' , 'Let us think about it')  ;
INSERT INTO VIEWING VALUES  ('CR76' ,'PG77' ,'01-DEC-00' , 'Wonderful')  ;
INSERT INTO VIEWING VALUES  ('CR56' ,'PG36' ,'01-JUN-1993' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR78' ,'PG76' ,'02-MAR-1995' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR83' ,'PG76' ,'01-NOV-1999' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR62' ,'PG76' ,'01-OCT-02' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR78' ,'PG16' ,'01-OCT-1999' ,'It is good')  ;
INSERT INTO VIEWING VALUES  ('CR83' ,'PG58' ,'15-OCT-02' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR62' ,'PG71' ,'01-JAN-02' , 'Wonderful')  ;
INSERT INTO VIEWING VALUES  ('CR79' ,'PG74' ,'01-JAN-1998' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR74' ,'PG74' ,'01-OCT-1999' , 'Wonderful')  ;
INSERT INTO VIEWING VALUES  ('CR84' ,'PG15' ,'15-APR-1995' ,'It is good')  ;
INSERT INTO VIEWING VALUES  ('CR81' ,'PG57' ,'01-JAN-1996' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR81' ,'PG72' ,'01-JUN-01' , 'I want to rent it ASAP')  ;
INSERT INTO VIEWING VALUES  ('CR87' ,'PG75' ,'01-APR-1999' , 'I like the kitchen the most')  ;
INSERT INTO VIEWING VALUES  ('CR85' ,'PG75' ,'01-NOV-01' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR87' ,'PG56' ,'01-DEC-01' , 'I want to rent it ASAP')  ;
INSERT INTO VIEWING VALUES  ('CR86' ,'PG59' ,'01-NOV-1997' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR85' ,'PG73' ,'01-JUN-02' , 'I like the kitchen the most')  ;

select table_name from all_tables where owner ='PROP'

SELECT * FROM REGISTRATION