# Cyclistic-bike-share-analysis-case-study

**Case Study 1**

**Case Study: How Does a Bike-Share Navigate Speedy Success?**
Introduction
	 Project  Case Study: How Does a Bike-Share Navigate Speedy Success/ ----

In this case study, I will follow the common data analysis process steps: ASK, PREPARE, PROCESS, ANALYZE, SHARE, ACT to support the marketing manager to make a data driven decision. Divvy Bike is a bike-share company based in Chicago. The director of marketing needs to Test a hypothesis that the company should pay attention to annual membership. I will participate with Compare between casual and annual membership to help the marketing manager to develop marketing strategy to convert the casual to annual membership.

**Cyclistic**:
Assets
- a 5,800 bicycle
- 600 docking stations

**Stackholders**
- Lily Moreno:
The director or marketing. The person behind developing the marketing campaigns and initiatives to promote the bike-share program. These may include email, social media, and other channels.
- Cyclistic marketing analytics team:
	Primary mission is to collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy.
- Cyclistic executive team:
	The notoriously detail-oriented executive team will decide whether to approve the recommended marketing program.

**About the company**
The company offers single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members

**Task** 
is to convince marketing executive team that converting casual riders to annual (cyclistic) riders should be the focus of the business

I will produce a report with the following deliverables:
A clear statement of the business task
A description of all data sources used
Documentation of any cleaning or manipulation of data
A summary of your analysis
Supporting visualizations and key findings
Your top three recommendations based on your analysis
Ask
Three questions will guide the future marketing program:
How do annual members and casual riders use Cyclistic bikes differently
Why would casual riders buy Cyclistic annual memberships?
How can Cyclistic use digital media to influence casual riders to become members?
Prepare
The data I will use in this case study stays in https://divvy-tripdata.s3.amazonaws.com/index.html
the data are organized in monthly trackers as follows
ride_id	
rideable_type
started_at
ended_at
start_station_name
start_station_id
end_station_name
end_station_id	start_lat
start_lng
end_lat	end_lng
member_casual
The data is here https://divvy-tripdata.s3.amazonaws.com/index.html the data are organized in monthly CSV records. Those record-sets are some kind fo tracking log for pickers uses. The data I used in this case study has been made available by Motivate International Inc. under this license. The record sets are fairly large. So, looking into it using only spreadsheet programs is not valid process. So I will just test the latest record using LibreOffice spreadsheet application and then I will import the entire data to MySQL database so I can do real data analysis work.

There are many options to combine the 12 CSV files into one file. Most of spreadsheets applications are not capable of doing that because of the max rows limitation. I choose to create a database for this. I used MySQL.
Here what I have done to combine the data in MySQL:
I created a database
-- show current databases
SHOW DATABASES;
-- CREATE database
CREATE DATABASE IF NOT EXISTS bike_share_db;
-- use bike_share_db
USE bike_share_db;
I created a table that has same attributes
-- create the data table used in bike_share_db
CREATE TABLE divvy_tripdata( ID int NOT NULL AUTO_INCREMENT
, ride_id varchar(50) NOT NULL
, rideable_type varchar(100)
, started_at DATETIME
, ended_at DATETIME
, start_station_name varchar(100)\
, start_station_id varchar(100)
, end_station_name varchar(100)
, end_station_id varchar(100)
, start_lat DOUBLE
, start_lng DOUBLE
, end_lat DOUBLE
, end_lng DOUBLE
, member_casual varchar(50)
, PRIMARY KEY (ID) );
In Dbeaver import functionality I imported the entire year CSV 12 files.
It was really good Idea to use SQL and create a database for storing the data. Non-surprisingly the number of rows in the combined data is 5,883,043 records. I wonder, Any change for spreadsheet apps to show up here!
Finally I exported the CSV combined 1.2 GB file to my work directory.
Process
In this stage I used R as processing tool. I know working in SQL might be more interesting however, the flexibility R with its libraries are undeniable.
The data in the CSV file is proven that data types are correct because it is how SQL work.


Guiding questions
What tools are you choosing and why?
Have you ensured your data’s integrity?
What steps have you taken to ensure that your data is clean?
How can you verify that your data is clean and ready to analyze?
Have you documented your cleaning process so you can review and share those results?
Key tasks
Check the data for errors.
Choose your tools.
Transform the data so you can work with it effectively.
Document the cleaning process.
Deliverable
Documentation of any cleaning or manipulation of data
the steps that I processed the data are as follows:
Download the previous 12 months of Cyclistic trip data.
Unzip the files.
Create a folder on your desktop or Drive to house the files. Use appropriate file-naming conventions.
Create subfolders for the .CSV file and the .XLS or Sheets file so that you have a copy of the original data. Move the downloaded files to the appropriate subfolder.
Follow these instructions for either Excel (a) or Google Sheets (b):
Launch Excel, open each file, and choose to Save As an Excel Workbook file. Put it in the subfolder you create for .XLS files.
Open each .CSV file in Google Sheets and save it to the appropriate subfolder.
Open your spreadsheet and create a column called “ride_length.” Calculate the length of each ride by subtracting the column “started_at” from the column “ended_at” (for example, =D2-C2) and format as HH:MM:SS using Format > Cells Time > 37:30:55.
Create a column called “day_of_week,” and calculate the day of the week that each ride started using the “WEEKDAY” command (for example, =WEEKDAY(C2,1)) in each file. Format as General or as a number with no decimals, noting that 1 = Sunday and 7 = Saturday.
Proceed to the analyze step.
Analyze
Since the


