/*Drop table if already Exists*/
Drop database if Exists TravelOnTheGo ;

Create database TravelOnTheGo ;

Use TravelOnTheGo;

/* --------------------------------------------------- Q.No 1 ---------------------------------------------------*/

create Table PASSENGER
(Passenger_name varchar(30),
 Category varchar(30),
 Gender varchar(10),
 Boarding_City varchar(40),
 Destination_City varchar(50),
 Distance int,
 Bus_Type varchar(20)
);

create table PRICE
(
 Bus_Type varchar(40),
 Distance int,
 Price int
 );
 
 /* --------------------------------------------------- Q.No 2 ---------------------------------------------------*/
 
 insert into PASSENGER values ("Sejal","AC","F","Bengaluru","Chennai",350,"Sleeper");
 insert into PASSENGER values ("Anmol","Non-AC","M","Mumbai","Hyderabad",700,"Sitting");
 insert into PASSENGER values ("Pallavi","AC","F","Panaji","Bengalur",60,"Sleeper");
 insert into PASSENGER values ("Khusboo","AC","F","Chennai","Mumbai",1500,"Sleeper");
 insert into PASSENGER values ("Udit","Non-AC","M","Trivandrum","panaji",1000,"Sleeper");
 insert into PASSENGER values ("Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting");
 insert into PASSENGER values ("Hemant","Non-AC","M","panaji","Mumbai",700,"Sleeper");
 insert into PASSENGER values ("Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting");
 insert into PASSENGER values ("Piyush","AC","M","Pune","Nagpur",700,"Sitting");
 
 Select * from Passenger;
 
insert into PRICE values ("Sleeper",350,770);
insert into PRICE values ("Sleeper",500,1100);
insert into PRICE values ("Sleeper",600,1320);
insert into PRICE values ("Sleeper",700,1540);
insert into PRICE values ("Sleeper",1000,2200);
insert into PRICE values ("Sleeper",1200,2640);
insert into PRICE values ("Sleeper",350,434);
insert into PRICE values ("Sitting",500,620);
insert into PRICE values ("Sitting",500,620);
insert into PRICE values ("Sitting",600,744);
insert into PRICE values ("Sitting",700,868);
insert into PRICE values ("Sitting",100,1240);
insert into PRICE values ("Sitting",1200,1488);
insert into PRICE values ("Sitting",1500,1860);

Select * from price;

/* --------------------------------------------------- Q.No 3 ---------------------------------------------------*/

select gender , count(gender) from passenger where Distance>=600 Group by gender;

/* --------------------------------------------------- Q.No 4 ---------------------------------------------------*/

select min(price) from price where Bus_Type = "Sleeper"  ;

/* --------------------------------------------------- Q.No 5 ---------------------------------------------------*/

Select Passenger_name from passenger where Passenger_name Like "S%";

/* --------------------------------------------------- Q.No 6 ---------------------------------------------------*/

select p.Passenger_name,p.Boarding_City,p.Destination_City,p.Bus_type,pr.Price from Passenger p , Price pr where (p.Bus_Type = pr.Bus_Type and p.Distance = pr.Distance);

/* --------------------------------------------------- Q.No 7 ---------------------------------------------------*/

select p.Passenger_name,pr.Price from Passenger p , Price pr where(p.Bus_Type="Sitting" and  pr.Bus_Type="Sitting" AND P.distance=1000 and pr.distance= 1000);

/* --------------------------------------------------- Q.No 8 ---------------------------------------------------*/

select Bus_Type , Price from price where distance = (select distance from passenger where passenger_name="Pallavi");

/* --------------------------------------------------- Q.No 9 ---------------------------------------------------*/

select distinct distance from Passenger order by distance DESC;

/* --------------------------------------------------- Q.No 10 ---------------------------------------------------*/

Select passenger_name , distance/(select sum(distance) from passenger)*100 as percentageOfDistance from passenger; 

/* --------------------------------------------------- Q.No 11 ---------------------------------------------------*/

select distance , price ,CASE 
When price>1000 then "Expensive" 
when price <1000 and price > 500 then "Average Cost" 
else "cheap" end as cost from price ;