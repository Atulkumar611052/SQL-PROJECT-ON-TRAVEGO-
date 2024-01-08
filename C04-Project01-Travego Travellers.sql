-- Task 1 --
-- Create Schema , Create table insert data into it --

Create schema Travego;
show databases;
use Travego;

-- CREATE PASSENGER TABLE --

Create table Passenger (
Passenger_id int not null,
Passenger_Name varchar(20),
Category varchar(20),
Gender varchar(20),
Boarding_City Varchar(20),
Destination_City varchar(20),
Distance int,
Bus_Type varchar(20)
);

-- CREATE PRICE TABLE--

Create table Price (
Id int not null,
Bus_Type Varchar(20),
Distance int,
Price int
);
Show tables;
show table status ;

-- INSERT VALUE IN TO PASSENGER TABLE -- 

insert into Passenger values 
(1,	"Sejal",	"AC",	"F",	"Bengaluru",	"Chennai",	350,	"Sleeper"),
(2,	"Anmol",	"Non-AC",	"M",	"Mumbai",	"Hyderabad",	700, "Sitting"),
(3,	"Pallavi",	"AC",	"F", "Panaji", "Bengaluru",	600,	"Sleeper"),
(4,	"Khusboo", 	"AC",	"F",	"Chennai",	"Mumbai",	1500,	"Sleeper"),
(5,"Udit",	"Non-AC",	"M",	"Trivandrum",	"Panaji",	1000,	"Sleeper"),
(6,	"Ankur",	"AC",	"M",	"Nagpur",	"Hyderabad",	500,	"Sitting"),
(7,	"Hemant",	"Non-AC",	"M",	"Panaji",	"Mumbai",	700,	"Sleeper"),
(8,	"Manish",	"Non-AC",	"M",	"Hyderabad",	"Bengaluru",	500,	"Sitting"),
(9,	"Piyush", "AC",	"M",	"Pune",	"Nagpur",	700,	"Sitting");

describe Passenger;
select * from Passenger;

-- INSERT VALUES INTO PRICE TABLE --

insert into Price values 
(1,	"Sleeper",	350,	770),
(2	,	"Sleeper",	500,	1100),
(3	,	"Sleeper",	600	,1320),
(4	,	"Sleeper",	700	,1540),
(5	,	"Sleeper",	1000,	2200),
(6	,	"Sleeper",	1200,	2640),
(7	,	"Sleeper",	1500,	2700),
(8,	"Sitting",	500,	620),
(9	,	"Sitting",	600,	744),
(10	,	"Sitting",	700	,868),
(11	,	"Sitting",	1000,	1240),
(12	,	"Sitting",	1200,	14880),
(13	,	"Sitting",	1500,	1860) ;

describe Price;
select * from Price;

-- TASK 2 --
-- SQL Script fo Queries --

-- a.	How many females and how many male passengers traveled a minimum distance of 600 KMs --

select Gender, count(Gender) from Passenger where Distance >=600 group by Gender;

-- b.	Find the minimum ticket price of a Sleeper Bus --
select Id, min(Price) from Price ;
select Bus_Type, min(Price) from Price ;

-- c.	Select passenger names whose names start with character 'S' --

select Passenger_Name from passenger where Passenger_Name like "S%";
select * from passenger where Passenger_Name like "S%";

-- d.	Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output --

select Passenger_Name, Boarding_City, Destination_City, PS.Bus_Type, Price from Passenger as PS,Price as PR 
    where PS.Bus_Type=PR.Bus_Type and PS.Distance=PR.Distance;
    
-- 	What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus  --
select Passenger_Name, PR.Price from Passenger as PS, Price as PR where PS.Distance >=1000 and PS.Bus_Type like "Sleeper";
select Passenger_Name, PR.Price from Passenger as PS, Price as PR where PS.Distance >=1000 and PS.Bus_Type like "Sitting";

-- f.	What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji --

select Passenger_Name, PR.Bus_Type, PR.Price from Passenger as PS, Price as PR where PS.Passenger_Name like "Pallavi" and PS.Distance = PR.Distance;
select * from Passenger as PS, Price as PR where PS.Passenger_Name like Passenger_Name and PS.Distance = PR.Distance;

-- g.	List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order. --

select Distance from Passenger;
select Distinct(Distance) from Passenger;

-- h.	Display the passenger name and percentage of distance traveled by that passenger from the total distance traveled by all passengers without using user variables --

Select Passenger_Name, Distance*100/(select sum(Distance) from Passenger) From Passenger;
Select Passenger_Name, Distance*100/(select sum(Distance) from Passenger) From Passenger as Percentage;
Select Passenger_Name, Distance*100/(select sum(Distance) from Passenger) as Percentage From Passenger;