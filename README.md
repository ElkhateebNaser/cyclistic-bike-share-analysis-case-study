# Cyclistic Bike Share Analysis Case Study

## Data Analysis Case Study /How Does a Bike-Share Navigate Speedy Success?

### Introduction
In this case study, I will follow the common data analysis process steps: ASK, PREPARE, PROCESS, ANALYZE, SHARE, ACT to support the marketing manager to make a data driven decision. Divvy Bike is a bike-share company based in Chicago. The director of marketing needs to Test a hypothesis that the company should pay attention to annual membership. I will participate with Compare between casual and annual membership to help the marketing manager to develop marketing strategy to convert the casual to annual membership.

### Assets
- a 5,800 bicycle
- 600 docking stations

### Riders
- **Cyclistic** The bikes riders are named under 2 category the first is cyclistics. those users buy annual membership.

- **Casual Riders** The users who buy daily membership. 

### Stackholders
- **Lily Moreno**: The director or marketing. The person behind developing the marketing campaigns and initiatives to promote the bike-share program. These may include email, social media, and other channels.
- **Cyclistic marketing analytics team**: Primary mission is to collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy.
- **Cyclistic executive team**: The notoriously detail-oriented executive team will decide whether to approve the recommended marketing program.

## About the company
The company offers single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members

## Task
The task is to convince marketing executive team that converting casual riders to annual (cyclistic) riders should be the focus of the business
This analysis main task is to study how Casual and member riders differ in sinse of pattern of using Divvy Bike service to decide which membership category the company shall focus on. 

## Data Sources
The data used in this project is availble publice on source https://divvy-tripdata.s3.amazonaws.com/index.html 

## Data Processing
***Pleae see the attached R Script for the step-by-step wrangling process***

## Summary of your analysis
This project concluded that developing the cyclistic membership is essential and more valuabe for the business in sense of
- Cyclistic riders do 33% more rides than casual riders
- Cyclistic rider continue use the servise during the whole year on contrary the casual riders disappear in winter months
- Cyclistic riders are fairly distributed arround the city on the otherhand casual riders are clustered arround the shore
- Cyclistic riders rides 6 million minutes longer than casual riders
- In Winter Cyclistic riders demand drop arround 50% on the other hand casual riders demand drops arround 90%
**In conclusion Yes the company must develop more cyclistic riders**

## My Data
**the data are organized in monthly trackers as follows**
ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual

The data is here https://divvy-tripdata.s3.amazonaws.com/index.html the data are organized in monthly CSV records. Those record-sets are some kind fo tracking log for pickers uses. The data I used in this case study has been made available by Motivate International Inc. The record sets are fairly large. So, looking into it using only spreadsheet programs is not valid process. Iused MySQL database so I can do real data analysis work.

## Data Tools Used
- MySQL: is a DBMS I used to store the combined data. as the combined data is more than 5 million record.
- DBeaver: another DBMS I used as it hase more fucntionality out-of-box.
- SQL: I needed SQL to do some data verification and construct the combine the table.
- RStudio: a suffesticated data analysis and scientific statitics anlysis application uses R programming.
- R: is a statistics programming language
- Tableau: besides MS-PowerBi I found it more proper to use Tableau as it is availbel MacBook:)





