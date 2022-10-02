-- see what exist
show databases;

-- create new database
create database if not exists bike;

-- put bike in use
use bike;

-- I created a table has the same structure
-- for our data
create table if not exists rdata
(
    ride_id            VARCHAR(50) NOT NULL,
    rideable_type      VARCHAR(100),
    started_at         DATETIME,
    ended_at           DATETIME,
    start_station_name VARCHAR(100),
    start_station_id   VARCHAR(100),
    end_station_name   VARCHAR(100),
    end_station_id     VARCHAR(100),
    start_lat          double,
    start_lng          double,
    end_lat            double,
    end_lng            double,
    member_casual      VARCHAR(50),
    PRIMARY KEY (ride_id)
);

-- load jan data
load data infile '202101-divvy-tripdata.csv'
into table bike.rdata
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines
(ride_id, rideable_type, started_at, 
ended_at, start_station_name, start_station_id,
end_station_name, end_station_id, 
@start_lat, @start_lng,
@end_lat, @end_lng,
member_casual)
set
start_lat = nullif(@start_lat, ''),
start_lng = nullif(@start_lng, ''),
end_lat = nullif(@end_lat, ''),
end_lng = nullif(@end_lng, '');

-- load feb data
load data infile '202102-divvy-tripdata.csv'
into table bike.rdata
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines
(ride_id, rideable_type, started_at, 
ended_at, start_station_name, start_station_id,
end_station_name, end_station_id, 
@start_lat, @start_lng,
@end_lat, @end_lng,
member_casual)
set
start_lat = nullif(@start_lat, ''),
start_lng = nullif(@start_lng, ''),
end_lat = nullif(@end_lat, ''),
end_lng = nullif(@end_lng, '');

-- load mar data
load data infile '202103-divvy-tripdata.csv'
into table bike.rdata
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines
(ride_id, rideable_type, started_at, 
ended_at, start_station_name, start_station_id,
end_station_name, end_station_id, 
@start_lat, @start_lng,
@end_lat, @end_lng,
member_casual)
set
start_lat = nullif(@start_lat, ''),
start_lng = nullif(@start_lng, ''),
end_lat = nullif(@end_lat, ''),
end_lng = nullif(@end_lng, '');

-- load apr data
load data infile '202104-divvy-tripdata.csv'
into table bike.rdata
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines
(ride_id, rideable_type, started_at, 
ended_at, start_station_name, start_station_id,
end_station_name, end_station_id, 
@start_lat, @start_lng,
@end_lat, @end_lng,
member_casual)
set
start_lat = nullif(@start_lat, ''),
start_lng = nullif(@start_lng, ''),
end_lat = nullif(@end_lat, ''),
end_lng = nullif(@end_lng, '');

-- load may data
load data infile '202105-divvy-tripdata.csv'
into table bike.rdata
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines
(ride_id, rideable_type, started_at, 
ended_at, start_station_name, start_station_id,
end_station_name, end_station_id, 
@start_lat, @start_lng,
@end_lat, @end_lng,
member_casual)
set
start_lat = nullif(@start_lat, ''),
start_lng = nullif(@start_lng, ''),
end_lat = nullif(@end_lat, ''),
end_lng = nullif(@end_lng, '');

-- load jun data
load data infile '202106-divvy-tripdata.csv'
into table bike.rdata
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines
(ride_id, rideable_type, started_at, 
ended_at, start_station_name, start_station_id,
end_station_name, end_station_id, 
@start_lat, @start_lng,
@end_lat, @end_lng,
member_casual)
set
start_lat = nullif(@start_lat, ''),
start_lng = nullif(@start_lng, ''),
end_lat = nullif(@end_lat, ''),
end_lng = nullif(@end_lng, '');

-- load jul data
load data infile '202107-divvy-tripdata.csv'
into table bike.rdata
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines
(ride_id, rideable_type, started_at, 
ended_at, start_station_name, start_station_id,
end_station_name, end_station_id, 
@start_lat, @start_lng,
@end_lat, @end_lng,
member_casual)
set
start_lat = nullif(@start_lat, ''),
start_lng = nullif(@start_lng, ''),
end_lat = nullif(@end_lat, ''),
end_lng = nullif(@end_lng, '');

-- load aug data
load data infile '202108-divvy-tripdata.csv'
into table bike.rdata
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines
(ride_id, rideable_type, started_at, 
ended_at, start_station_name, start_station_id,
end_station_name, end_station_id, 
@start_lat, @start_lng,
@end_lat, @end_lng,
member_casual)
set
start_lat = nullif(@start_lat, ''),
start_lng = nullif(@start_lng, ''),
end_lat = nullif(@end_lat, ''),
end_lng = nullif(@end_lng, '');

-- load sep data
load data infile '202109-divvy-tripdata.csv'
into table bike.rdata
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines
(ride_id, rideable_type, started_at, 
ended_at, start_station_name, start_station_id,
end_station_name, end_station_id, 
@start_lat, @start_lng,
@end_lat, @end_lng,
member_casual)
set
start_lat = nullif(@start_lat, ''),
start_lng = nullif(@start_lng, ''),
end_lat = nullif(@end_lat, ''),
end_lng = nullif(@end_lng, '');

-- load oct data
load data infile '202110-divvy-tripdata.csv'
into table bike.rdata
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines
(ride_id, rideable_type, started_at, 
ended_at, start_station_name, start_station_id,
end_station_name, end_station_id, 
@start_lat, @start_lng,
@end_lat, @end_lng,
member_casual)
set
start_lat = nullif(@start_lat, ''),
start_lng = nullif(@start_lng, ''),
end_lat = nullif(@end_lat, ''),
end_lng = nullif(@end_lng, '');

-- load nov data
load data infile '202111-divvy-tripdata.csv'
into table bike.rdata
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines
(ride_id, rideable_type, started_at, 
ended_at, start_station_name, start_station_id,
end_station_name, end_station_id, 
@start_lat, @start_lng,
@end_lat, @end_lng,
member_casual)
set
start_lat = nullif(@start_lat, ''),
start_lng = nullif(@start_lng, ''),
end_lat = nullif(@end_lat, ''),
end_lng = nullif(@end_lng, '');

-- load dec data
load data infile '202112-divvy-tripdata.csv'
into table bike.rdata
fields terminated by ','
lines terminated by '\r\n'
ignore 1 lines
(ride_id, rideable_type, started_at, 
ended_at, start_station_name, start_station_id,
end_station_name, end_station_id, 
@start_lat, @start_lng,
@end_lat, @end_lng,
member_casual)
set
start_lat = nullif(@start_lat, ''),
start_lng = nullif(@start_lng, ''),
end_lat = nullif(@end_lat, ''),
end_lng = nullif(@end_lng, ''); 

-- after import the 12 worksheets into tb_div
-- by the way the rows there are more than
-- 5 million rows. so, no way to do it in Excel
-- however we can use copy paste to move the data
-- in the 12 csv files into a single csv combined 

-- create a backup
create table rdata1 as 
select * from rdata;

-- a good idea is to eliminate invalid records
-- lets delete the records that ride length
-- less than 3 minutes.
delete
from rdata
where ended_at <= started_at;

-- I guess enough here. let to to R. R will be mush faster
-- the reason SQL is better until here is that you can specify
-- data types much easier.

-- I used the export option in DBeaver. we have around
-- 5,000,000 nice rows.

-- export
table rdata 
into outfile 'combined data.csv'     
fields terminated by ','  
optionally enclosed by '"'    
lines terminated by '\r\n';
