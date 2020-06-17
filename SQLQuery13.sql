create database carr ;
create table Car (
c_ID int primary key , 
c_Type varchar(255) ,
);
create table Locations (
l_ID int primary key , 
l_City varchar(255) ,
c_ID int foreign key references car (c_ID)
);
create table Truck (
t_ID int primary key , 
t_Type varchar(255) ,
l_ID int foreign key references Locations (l_ID)
);
create table Reserve (
r_ID int primary key , 
r_City varchar(255) ,
r_VehicleType varchar(255) ,
r_PickupDate int ,
r_ReturnDate int ,
r_PhoneNumber int ,
l_ID int foreign key references Locations (l_ID) 
);
create table customer (
s_ID int primary key , 
s_Name varchar(255) ,
s_address varchar(255) ,
s_phoneNumber int ,
);
create table Returnss (
e_ID int primary key , 
e_ReturnDate int ,
e_Time int ,
e_Odometer int ,
e_FullTank int ,
e_City varchar(255) ,
e_phoneNumber int ,
s_ID int foreign key references customer (s_ID) ,
l_ID int foreign key references Locations (l_ID)
);
insert into car 
values (1 , 'Mercedes');
insert into Locations (l_ID, l_City)
values (2 , 'kafer el-sheikh');
insert into Customer (s_ID , s_Name , s_Address , s_PhoneNumber)
values (3 , 'Ahmed' , 'alex.' , 5555);
insert into Reserve(r_ID , r_City , r_VehicleType , r_PickupDate , r_ReturnDate , r_PhoneNumber)
values (4 , 'alex' , 'Mercedes' , 1/1/2020 , 4/1/2020 , 3333);
insert into Returnss (e_ID , e_ReturnDate , e_Time , e_Odometer , e_FullTank , e_City , e_PhoneNumber)
values (5 , 4/1/2020 , 4 , 300 , 30 , 'alex' , 4444 ); 
insert into car 
values (6 , 'B M W');
insert into Locations (l_ID, l_City)
values (7 , 'kafer el-sheikh');
insert into Customer (s_ID , s_Name , s_Address , s_PhoneNumber)
values (8 , 'ali' , 'cairo' , 2222);
insert into Reserve(r_ID , r_City , r_VehicleType , r_PickupDate , r_ReturnDate , r_PhoneNumber)
values (9 , 'cairo' , 'B M W' , 6/1/2020 , 10/1/2020 , 7777);
insert into Returnss (e_ID , e_ReturnDate , e_Time , e_Odometer , e_FullTank , e_City , e_PhoneNumber)
values (10 , 10/1/2020 , 6 , 400 , 25 , 'cairo' , 8888 ); 
delete from Car where c_ID = 6 ;
delete from Locations where l_City = 'kafer el-sheikh' ;
delete from Customer where s_address = 'cairo' ;
delete from reserve where r_PhoneNumber = 7777 ;
delete from Returnss where e_Odometer = 400 ;
update car 
set c_type = 'bye 4 bye'
where c_ID = 1 ;
update Locations
set l_City = 'Giza'
where l_ID = 2 ;
update Reserve
set r_PhoneNumber = 1234
where r_ReturnDate = 8/1/2020 ;
update Returnss
set e_Odometer = 500
where e_Time = 5 ;
update Customer
set s_Name = 'Hassan'
where s_Address = 'mansoura' ;
select s_Name , r_City 
from Customer 
inner join Reserve on Customer.s_ID = Reserve.r_ID ; 
select e_city , s_address 
from Returnss 
left join Customer on Returnss.s_ID = Customer.s_ID ;
select e_Time , e_City 
from Customer 
right join Returnss on Returnss.s_ID = Customer.s_ID ;
select l_city , t_type
from Locations
full join Truck on Locations.l_ID =  Truck.t_ID ;
select l_City , r_PhoneNumber 
from Locations , Reserve 
where Locations.l_ID = Reserve.r_ID ;
select count(s_PhoneNumber) , s_Name
from Customer 
group by s_name ; 
select e_city
from Returnss 
where e_ID = (select e_ID from Locations where e_ID = 2) ; 
select r_City , r_VehicleType
from Reserve 
where r_PhoneNumber > (select count(s_ID) from Customer ) ; 
select l_City 
from Locations 
where l_City = (select e_City from Returnss where e_City = 'cairo') ; 
select c_Type
from Car ;
select * 
from Truck ;
select distinct l_City 
from Locations ;
SELECT TOP 10 * 
FROM Customer ;
SELECT TOP 10 PERCENT R_City 
FROM Reserve ; 
SELECT c_ID 
FROM Car
ORDER BY c_Type ;
SELECT s_ID 
FROM Customer
ORDER BY s_PhoneNumber desc ;
SELECT  r_City
FROM Reserve
ORDER BY r_PhoneNumber ASC;
SELECT MIN(e_time)
FROM Returnss ;
select MAX(e_city)
from Returnss ; 
SELECT AVG(e_Odometer)
FROM Returnss ;
SELECT SUM(e_FullTank)
FROM Returnss ;
SELECT *
FROM Car
WHERE c_ID = 1 ;
SELECT s_Name
FROM customer
WHERE s_Name LIKE 'a%';
SELECT s_Name
FROM customer
WHERE s_Name IN ('ahmed', 'fatma' , 'ommar');
SELECT r_City AS MyCity
FROM Reserve;
SELECT c_type
FROM Car
WHERE c_ID BETWEEN 20 AND 50;
SELECT s_PhoneNumber , s_Name
FROM Customer
WHERE s_Name IN ('ahmed', 'fatma' , 'ommar') AND s_Name LIKE 'a%' ;
SELECT e_Time , e_ReturnDate
FROM Returnss
WHERE e_City IN ('cairo', 'alex' ,'giza') or e_FullTank LIKE '%a%' ;
SELECT e_FullTank
FROM Returnss
WHERE NOT e_FullTank = 80;