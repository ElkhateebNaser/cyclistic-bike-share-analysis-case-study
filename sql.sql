-- I created new db
create database db_divvy_bike;

-- put divvy_bike_db in use
use db_divvy_bike;

-- I created a table has the same structure
-- for our data
CREATE TABLE tb_div (
    ID INT NOT NULL AUTO_INCREMENT,
    ride_id VARCHAR(50) NOT NULL,
    rideable_type VARCHAR(100),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(100),
    start_station_id VARCHAR(100),
    end_station_name VARCHAR(100),
    end_station_id VARCHAR(100),
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR(50),
    PRIMARY KEY (ID)
);


-- after import the 12 worksheets into tb_div 
-- by the way the rows there are more than 
-- 5 million rows. so, no way to do it in Excel


-- at this point it is good idea to make a backup
create table 
	tb_div_backup_1
as
	select
		*
	from 	
		tb_div
	;

-- a good idea is to eliminate invalid records
-- lets delete the records that ride length 
-- less than 3 minuts. 
delete from 
	tb_div 
where 
	timediff(ended_at, started_at) < "00:03:00"
	;
	
-- I added teh following columns to help understading
alter table 
	tb_div 
add column
	ridding_length time
after
	ended_at
,
add column
	ridding_minutes int
after 
	ridding_length 
,
add column 
	day_of_ride char(10)
after 
	ridding_minutes
,
add column
	week_of_ride int
after 
	day_of_ride
,
add column
	month_of_ride int
after 
	week_of_ride
	;

update
	tb_div 
set
	ridding_length = timediff(ended_at, started_at)
	, 
	ridding_minutes =  time_to_sec(ridding_length) / 60
	, 	
	day_of_ride  = dayofweek(started_at)
	,
	week_of_ride = week(started_at)
	,
	month_of_ride  = month(started_at) 
	 ;
	
-- I guess enougth here. let to to R. R will be mush faster
-- the reason SQL is better until here is that you can specify
-- data types much easier. 
	
-- I used the export option in DBeaver. we have arround 
-- 5,000,000 nice rows.