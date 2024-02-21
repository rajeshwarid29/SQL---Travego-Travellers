#1st Question
#a 
create database Travego;
use Travego;
create table Passenger(passenger_id int,
passenger_name varchar(20),
category varchar(20),
gender varchar(20),
boarding_city varchar(20),
destination_city varchar(20),
distance int,
bus_type varchar(20));
show tables;
select * from Passenger;
describe Passenger;

create table Price(id int,
bus_type varchar(20),
distance int,
price int);
select * from Price;
describe Price;

#b
insert into Passenger
values(1,'Sejal','Ac','F','Bengaluru','Chennai',350,'Sleeper'),
(2,'Anmol','Non-Ac','M','Mumbai','Hyderabad',700,'Sitting'),
(3,'Pallavi','Ac','F','Panaji','Bengaluru',600,'Sleeper'),
(4,'Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
(5,'Udit','Non-Ac','M','Trivandrum','Panaji',1000,'Sleeper'),
(6,'Ankur','Ac','M','Nagpur','Hyderabad',500,'Sitting'),
(7,'Hemant','Non-Ac','M','Panaji','Mumbai',700,'Sleeper'),
(8,'Manish','Non-Ac','M','Hyderabad','Bengaluru',500,'Sitting'),
(9,'Piyush','Ac','M','Pune','Nagpur',700,'Sitting');

insert into Price
values(1,'Sleeper',350,770),
(2,'Sleeper',500,1100),
(3,'Sleeper',600,1320),
(4,'Sleeper',700,1540),
(5,'Sleeper',1000,2200),
(6,'Sleeper',1200,2640),
(7,'Sleeper',1500,2700),
(8,'Sitting',500,620),
(9,'Sitting',600,744),
(10,'Sitting',700,868),
(11,'Sitting',1000,1240),
(12,'Sitting',1200,1488),
(13,'Sitting',1500,1860);

select * from Passenger; 
select * from Price;

#2nd question
#a
#how many female passengers travelled a minimum distance of 600 kms
select count(*) from Passenger
where Gender = 'F' and distance >=600;

#b
#query to display the passenger details whose travel distance is greater
# than 500 and who are travelling in a sleeper bus
select * from Passenger
where distance > 500 and bus_type = 'sleeper'; 

#c
#select passenger names whose names start with the character 'S'.
select * from Passenger
where passenger_name like 's%';

#d
#Calculate the price charged for each passenger,displaying the 
#Passengername,BoardingCity,DestinationCity,Bustype,and
#Price in the output.
select P.passenger_name, P.boarding_city, P.destination_city,P.bus_type, Pr.price 
from Passenger P
join Price Pr
on P.distance = Pr.distance
and P.bus_type = Pr.bus_type;

#e
#What are the passenger name(s) and the ticket price for 
#those who traveled 1000 KMs Sitting in a bus?
select P.passenger_Name,P.distance,P.bus_type,Pr.Price
from Passenger P
join Price Pr 
on P.distance = Pr.distance 
and P.bus_type = Pr.bus_type
where P.distance = 1000 and P.bus_type = 'Sitting';

#f
#What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select P.passenger_name, P.bus_type, P.distance, Pr.price
from Passenger P
join Price Pr
on P.distance = Pr.distance
and P.bus_type = Pr.bus_type
where P.passenger_name = 'Pallavi' and P.boarding_city = 'Bengaluru' and P.destination_city = 'Panaji';

#g
#Alter the column category with the value "Non-AC" where the Bus_Type is sleeper
update Passenger
set category = 'Non-AC'
where Bus_Type = 'Sleeper';

#h
#Delete an entry from the table where the passenger name is Piyush and commit this change in the database
delete from Passenger
where passenger_name = 'Piyush';
commit;

#i
#Truncate the table passenger and comment on the number of rows in the table(explain if required)
truncate table Passenger;

# This query will remove all rows from the passenger table.

#j
#Delete the table passenger from the database
drop table Passenger;
