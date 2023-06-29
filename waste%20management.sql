create table MyDimDate(
dateid integer NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
date date not null,
year integer not null,
quarter integer not null,quartername char(2) not null,
month integer not null,monthname varchar(16)not null,
day integer not null,
weekdayname varchar(16)not null,
primary key (dateid)
);



create table MyDimWaste(
wasteid integer not null , wastetype varchar(20) not null,
primary key(wasteid)
);


create table MyDimZone(
zoneid integer not null,
collectionzone varchar(30)not null,
city varchar(30) not null, 
primary key(zoneid)
);


create table MyFactTrips(
tripnumber integer not null,
waste_in_tons decimal(6,2) not null,
primary key (tripnumber),
zoneid integer,wasteid integer,dateid integer,
foreign key(zoneid) references MyDimZone(zoneid),
foreign key(wasteid) references MyDimWaste(wasteid),
foreign key(dateid) references MyDimDate(dateid)
);

--inserting value and checking
insert into MYDIMDATE(date,year,quarter,quartername,month,monthname,day,weekdayname) values('2021-01-01',1,1,'q1',1,'Jan',1,'Monday');
select * from mydimdate;

---droping them now except date dimension since this table complies with data provided ( just the table name needs changing),
drop table mydimdate;
drop table mydimwaste;
drop table mydimzone;
drop table myfacttrips;

---creating new tables acc to csv data


create table DimDate(
dateid integer NOT NULL,
--GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1)
date date not null,
year integer not null,
quarter integer not null,
quartername char(2) not null,
month integer not null,
monthname varchar(16)not null,
day integer not null,
weekday int not null,
weekdayname varchar(16)not null,
primary key (dateid)
);


create table DimTruck(
truckid int not null,
trucktype varchar(10) not null,
primary key (truckid)
);

create table DimStation(
stationid int not null,
city varchar(20) not null,
primary key(stationid));

create table FactTrip(
tripid int not null,
dateid int,
stationid int,
truckid int,
wastecollected decimal(5,2) not null,
primary key (tripid),
foreign key (dateid) references DimDate(dateid),
foreign key (stationid) references DimStation(stationid),
foreign key (truckid) references DimTruck(truckid)

);



--Viewing data

select * from dimdate limit 5;
select * from dimstation limit 5;
select * from dimtruck limit 5;
select * from facttrip limit 5;





-- working with operation-not-allowed-reason-code-1

select  rtrim(tabschema) || '.' || rtrim(tabname) as qual_tab,const_checked,status,access_mode from syscat.tables
where CONST_CHECKED like '%N%' 
    or status != 'N'
    or access_mode != 'F'
with ur;

select 'create table dba.except_' || rtrim(tabname) || ' like ' 
    || rtrim(tabschema) || '.' || rtrim(tabname) || ';' 
from syscat.tables 
where CONST_CHECKED like '%N%' 
    or status != 'N'
    or access_mode != 'F'
with ur;


create table dba.except_DIMTRUCK like PYN94037.DIMTRUCK;
create table dba.except_DIMSTATION like PYN94037.DIMSTATION;
create table dba.except_FACTTRIP like PYN94037.FACTTRIP;


--ignore above code since we dont have priveledges theres no point solving it


--Viewing data again after manually loading data and creating new tables

select * from dimdate limit 5;
select * from dimstation limit 5;
select * from dimtruck limit 5;
select * from facttrips limit 5;

-- Create a grouping sets query using columns stationid, trucktype, total waste collected.

select stationid, trucktype, sum(wastecollected) 
from facttrips f
join dimtruck t on f.truckid = t.truckid 
group by grouping sets (stationid,trucktype);


--Create a rollup query using the columns year, city, stationid, and total waste collected.

select year, city, f.stationid, sum(wastecollected) as totalWasteCollected
from facttrips f 
join dimstation s on f.stationid=s.stationid 
join dimdate d on f.dateid=d.dateid
group by rollup( year, city, f.stationid);

--Create a cube query using the columns year, city, stationid, and average waste collected.

select year, city, f.stationid, avg(wastecollected) as "Average Waste Collected"
from facttrips f 
join dimstation s on f.stationid=s.stationid 
join dimdate d on f.dateid=d.dateid
group by cube( year, city, f.stationid);


--Create an MQT named max_waste_stats using the columns city, stationid, trucktype, and max waste collected.

create table max_waste_stats(city, stationid, trucktype,  max_waste_collected)
as (select s.city, f.stationid, t.trucktype,max(wastecollected)
from facttrips f 
join dimtruck t on f.truckid=t.truckid
join dimstation s on f.stationid=s.stationid 
group by s.city,f.stationid,t.trucktype)
data initially deferred 
refresh deferred 
maintained by system;

refresh table max_waste_stats;
select * from max_waste_stats limit 5;


















