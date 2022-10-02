# CASE STUDY - HOW DOES A BIKE SHARE NAVIGATE SPEEDY SUCESS?

# BACKGROUND
# __________
# In 2016, Cyclistic launched a successful bike-share oﬀering. Since then, 
# the program has grown to a ﬂeet of 5,824 bicycles that are geo-tracked 
# and locked into a network of 692 stations across Chicago. The bikes can
# be unlocked from one station and returned to any other station in 
# the system anytime

# KICKOFF
# _______
# download the pdf case description from the link below...
# https://d3c33hcgiwev3.cloudfront.net/aacF81H_TsWnBfNR_x7FIg_36299b28fa0c4a5aba836111daad12f1_DAC8-Case-Study-1.pdf?Expires=1664064000&Signature=CStM7l12qBkQOa9RzxOxrI4lUzYb36PTLkSO3xvdZl96ZqWf9cuI96R9RUGKC8D8MA2NpILiGAJGvFcrdI3~vfkhf2dLxmrl-mkelrPbbZQcK~Wa4nk-XNndfO3ZB-e-pnQeCN0SriMLrcDWrmDNUr7oAE6f3NREWy0GCwOpLCA_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A
# installing the following packages is
# necessary in case they are no already
# install.packages("tidyverse")
# install.packages("lubridate")
# install.packages("hydroTSM")
# install.packages("chron")

# UNDERSTAND BUSINESS TASK
# _________________________
# 1- The director of marketing believes the company’s future success
#   depends on maximizing the number of annual memberships.
# 2- the difference how casual_member, cyclistic_member each group
#   how they do behave.
# 3- provide valid recommendation to the cyclistic executive to
#   to get the marketing plan approval.
# 4- Cyclistic’s ﬁnance analysts have concluded that annual members
#   are much more proﬁtable than casual riders.


# PROJECT DATA
# ____________
# the data is available in:
# https://divvy-tripdata.s3.amazonaws.com/index.html
# The data has been made available by Motivate International Inc.
# under this license:
# https://www.divvybikes.com/data-license-agreement
# the data consists of monthly data sets. I studied the most
# recent 12 month. It consists of more than 5 million rows
# in 12 csv files.
# using MySQL the tables are well maintained, data types
# are consistent. after I did some data cleaning the cleaned
# data looks like ...

# DATASET STRUCTURE
# _________________
# "ID"
# , "ride_id"
# , "rideable_type"
# , "started_at"
# , "ended_at"
# , "ridding_length"
# , "ridding_minutes"
# , "day_of_ride"
# , "week_of_ride"
# , "month_of_ride"
# , "start_station_name"
# , "start_station_id"
# , "end_station_name"
# , "end_station_id"
# , "start_lat"
# , "start_lng"
# , "end_lat"
# , "end_lng"
# , "member_casual"

# ESSENTIAL R PACKAGES
# ____________________
# loading tidyverse
# loading lubridate
# loading hydroTSM
# loading chron
# in case any of the above libraries not already installed, then it 
# should be using the command install.packages("*"), replace the * by 
# package name

# LOAD THE PACKAGES
# _________________
library(tidyverse)
library(lubridate)
library(hydroTSM)
library(chron)

# BEFORE IMPORTING DATA
# _____________________
# I have already done some preparation, and processing in MySQL. 
# the data file I will use here is a combined csv file of the downloaded 
# 12 csv source from https://divvy-tripdata.s3.amazonaws.com/index.html.
# the file size exceeded 1.2 GB. and consists of more than 5 million 
# records the data was collected between 2021-09 and 2022-08. 
# the time I created this portfolio project

# IMPORT DATA
# ___________
df <- data.frame(read.csv("combined-data.csv"))

# understand data
# _______________
df
glimpse(df)
str(df)
names(df)
summary(df)

# WANGLING THE DATA 
# _________________
# convert rideable_type to factor
# convert member_casual to factor
# convert started_at to datetime
# convert ended_at to datetime
# convert start_station_name to factor
# convert start_station_id to factor
# convert end_station_name to factor
# convert end_station_id to factor
# convert location detail to double
# recalculate ridding minutes  as float
# add column day_name as factor
# add column month_name as factor
# add ridding_season
# add week_of_ride
# add year_of_ride

# APPLY
# _____
# convert rideable_type to factor
df$rideable_type <- as.factor(df$rideable_type)
# convert member_casual to factor
df$member_casual <- as.factor(df$member_casual)
# convert started_at to datetime
df$started_at <- as_datetime(df$started_at)
# convert ended_at to datetime
df$ended_at <- as_datetime(df$ended_at)
# convert start_station_name to factor
df$start_station_name <- as.factor(df$start_station_name)
# convert start_station_id to factor
df$end_station_id <- df$end_station_id
# convert end_station_name to factor
df$end_station_name <- as.factor(df$end_station_name)
# convert end_station_id to factor
df$end_station_id <- as.factor(df$end_station_id)
# calculate ridding minutes  as float
df$ridding_minutes <-
  round(difftime(df$ended_at, df$started_at) / 60 , digits = 2)
# convert location data to double
df$start_lat <- as.double(df$start_lat)
df$end_lat <- as.double(df$end_lat)
df$start_lng <- as.double(df$start_lng)
df$end_lng <- as.double(df$end_lng)
# add column day_name as factor
df$day_of_ride <- as.factor(weekdays(df$started_at))
# add column month_name as factor
df$month_of_ride <- as.factor(month(df$started_at, label = TRUE))
# add ridding_season
df$season_of_ride <-
  as.factor(time2season(df$started_at, out.fmt = "seasons"))
# add year_of_ride
df$year_of_ride <- as.factor(year(df$started_at))
# add week_of_ride
df$week_of_ride <- as.factor(week(df$started_at))
# add y_day_of_ride
df$y_day_of_ride <-
  as.numeric(strftime(df$started_at, format = "%j"))
# at this point we have sufficient and clean data
# the best direction from here is to export a data 
# sample at a valid sample size
# first lets see the length of our population 
length(df$ride_id)
# it is 5,594,410
# for a population size of 5,594,410 and at standard 
# confidence level ~ 99 (%)% and margin of error ~ 1/2 (%).
# we can a sample size ~ 65,000 record could be more
# than perfect according to surveymonkey sample size calc
# https://www.surveymonkey.com/mp/sample-size-calculator/

sdf <- sample_n(df, 65000)


# I added a column named random10 inspect random 10 records
sdf$random10 <- ""

rndlist <- sample(1:length(sdf$ride_id), 10)

for (i in rndlist){
  sdf$random10[i] <- sdf$ride_id[i]
}

# see the new structure
str(sdf)

# export
write.csv(sdf,
          "exports\\sample-65.csv" ,
          row.names = TRUE)
