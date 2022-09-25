# CASE STUDY - HOW DOES A BIKE SHARE NAVIGATE SPEEDY SUCESS?

# BACKGROUND
# In 2016, Cyclistic launched a successful bike-share oﬀering. Since then, the
# program has grown to a ﬂeet of 5,824 bicycles that are geo-tracked and locked
# into a network of 692 stations across Chicago. The bikes can be unlocked from
# one station and returned to any other station in the system anytime

# KICKOFF
# download the pdf case description from the link below...
# https://d3c33hcgiwev3.cloudfront.net/aacF81H_TsWnBfNR_x7FIg_36299b28fa0c4a5aba836111daad12f1_DAC8-Case-Study-1.pdf?Expires=1664064000&Signature=CStM7l12qBkQOa9RzxOxrI4lUzYb36PTLkSO3xvdZl96ZqWf9cuI96R9RUGKC8D8MA2NpILiGAJGvFcrdI3~vfkhf2dLxmrl-mkelrPbbZQcK~Wa4nk-XNndfO3ZB-e-pnQeCN0SriMLrcDWrmDNUr7oAE6f3NREWy0GCwOpLCA_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A
# installing the following packages is
# necessary in case they are no already
# install.packages("tidyverse")
# librinstall.packages("lubridate")
# install.packages("hydroTSM")
# install.packages("chron")

# UNDERSTAND BUSINESS TASK
# 1- The director of marketing believes the company’s future success
#   depends on maximizing the number of annual memberships.
# 2- the difference how casual_member, cyclistic_member each group
#   how they do behave.
# 3- provide valid recommendation to the cyclistic executive to
#   to get the marketing plan approval.
# 4- Cyclistic’s ﬁnance analysts have concluded that annual members
#   are much more proﬁtable than casual riders.


# PROJECT DATA
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
# loading tidyverse
# loading lubridate
# loading hydroTSM
# loading chron
# in case any of the above libraries not already installed, then it should be 
# using the command install.packages("*"), replace the * by package name

# [CODE] LOAD THE PACKAGES
library(tidyverse)
library(lubridate)
library(hydroTSM)
library(chron)

# BEFORE IMPORTING DATA 
# I have already done some preparation, and processing in MySQL. the data file
# I will use here is a combined csv file of the downloaded 12 csv source from 
# https://divvy-tripdata.s3.amazonaws.com/index.html.
# the file size exceeded 1.2 GB. and consists of more than 5 million records
# the data was collected between 2021-09 and 2022-08. the time I created this
# portfolio project

# [CODE] IMPORT DATA
# >>> create file path variable
mydata <- read.csv("tb_div_202209212041.csv")
# >>> create dataframe variable and load data into it
df <- data.frame(mydata)

# [CODE] PREPARING AND UNDERSTANDING THE DATASET 
# >>> create backup copy
df_bcp <- data.frame(mydata)
# >>> overview the data

summary(df)
head(df)
glimpse(df)
str(df)

# WANGLING THE DATA 
# I noticed I need to do some data wrangling
# the following implementation are needed
# convert rideable_type to factor
# convert member_casual to factor
# convert started_at to datetime
# convert ended_at to datetime
# convert ridding_length to time
# convert start_station_name to factor
# convert start_station_id to factor
# convert end_station_name to factor
# convert end_station_id to factor
# recalculate ridding minutes  as float
# add column day_name as factor
# add column month_name as factor
# add ridding_season
# add week_of_ride
# add year_of_ride


# [CODE] APPLY
# >>> convert rideable_type to factor
df$rideable_type <- as.factor(df$rideable_type)
# >>> convert member_casual to factor
df$member_casual <- as.factor(df$member_casual)
# >>> convert started_at to datetime
df$started_at <- as_datetime(df$started_at)
# >>> convert ended_at to datetime
df$ended_at <- as_datetime(df$ended_at)
# >>> convert ridding_length to time
df$ridding_length <- chron(times = df$ridding_length)
# >>> convert start_station_name to factor
df$start_station_name <- as.factor(df$start_station_name)
# >>> convert start_station_id to factor
df$end_station_id <- df$end_station_id
# >>> convert end_station_name to factor
df$end_station_name <- as.factor(df$end_station_name)
# >>> convert end_station_id to factor
df$end_station_id <- as.factor(df$end_station_id)
# >>> recalculate ridding minutes  as float
df$ridding_minutes <-
  round(difftime(df$ended_at, df$started_at), digits = 2)
# >>> add column day_name as factor
df$day_of_ride <- as.factor(weekdays(df$started_at))
# >>> add column month_name as factor
df$month_of_ride <- as.factor(month(df$month_of_ride, label = TRUE))
# >>> add ridding_season
df$season_of_ride <-
  as.factor(time2season(df$started_at, out.fmt = "seasons"))
# >>> add year_of_ride
df$year_of_ride <- as.factor(year(df$started_at))
# >>> add week_of_ride
df$week_of_ride <- as.factor(week(df$started_at))
# >>> add y_day_of_ride
df$y_day_of_ride <-
  as.numeric(strftime(df$started_at, format = "%j"))
# see the newe structure
str(df)

# [CODE] DISCOVER FACTS
# please note: I have a lot of verification in MySQL phase. so, I will not repeat here the same. however, I may repeat few steps if it serves the context structure.
# >>> dataset length

length(df$ID)
# >>> complete records
summary(as.factor(complete.cases(df)))
# >>> check if start and end station have enough data
missing_start_end_station <-
  data.frame(
    missing_station_records = c(
      misisng_start_station_id = sum(df$start_station_id == ""),
      missing_end_station_id = sum(df$end_station_id == "")
    )
  )
# >>> print to the console

missing_start_end_station
# >>> export
write.csv(missing_start_end_station,
          "exports\\missing_start_end_statio.csv" ,
          row.names = TRUE)

# UNDERSTAND THE DATA IN BUSINESS SENSES
# as the main business concern for this task is to study the differ between how
# the casual members vs the cyclistic [annual] members behave and recognize 
# insights that could support the purpose of the study which is converting
# causal members to cyclistic members is the future of the business


# [CODE] ACTION 
# I know there is ton of questions out there. but let start with the question
#  in the above section

# member_rideable_type 
# >>> for each member type how many rides under each rideable_type
member_rideable_type <-
  table(member_type = df$member_casual,
        rideable_type = df$rideable_type)
member_rideable_type
# >>> export
write.csv(member_rideable_type,
          "exports\\member_rideable_type.csv" ,
          row.names = TRUE)

# member_avg_riding_time 

member_avg_riding_time <- df %>%
  group_by(member_type = member_casual) %>%
  summarise(average_ridding_time = mean(ridding_minutes))

member_avg_riding_time

# >>> export
write.csv(member_avg_riding_time,
          "exports\\member_avg_riding_time.csv" ,
          row.names = TRUE)


# rideable_types_weight 
# >>> rideable_types_weight
rideable_types_weight <-
  data.frame(rideable_types_weight 
             = round(summary(as.factor(df$rideable_type))
                     / length(df$ID) * 100, digits = 1))

rideable_types_weight

# export
write.csv(rideable_types_weight,
          "exports\\rideable_types_weight.csv" ,
          row.names = TRUE)


# View weight of member types 
# >>> member_casual_weight
member_casual_weight <-
  data.frame(member_casual_weight = round(
    summary(as.factor(df$member_casual)) 
    / length(df$member_casual) * 100, digits = 1))

# export
write.csv(member_casual_weight,
          "exports\\member_casual_weight.csv" ,
          row.names = TRUE)


# usage average time for each member group 
# >>> riding_time_by_member_group
riding_time_by_member_group <- df %>%
  group_by(df$member_casual) %>%
  summarize(avg_ridding_time =
              mean(ridding_length))

# export
write.csv(
  riding_time_by_member_group,
  "exports\\riding_time_by_member_group.csv" ,
  row.names = TRUE
)


# riding_time_by_rideable_group 
riding_time_by_rideable_group <-  df %>%
  group_by(rideable_type) %>%
  summarise(avg_riding_time = mean(ridding_length))

riding_time_by_rideable_group

# export
write.csv(
  riding_time_by_rideable_group,
  "exports\\riding_time_by_rideable_group.csv" ,
  row.names = TRUE
)


# riding_group_size 
riding_group_size <- df %>%
  group_by(rideable_type) %>%
  summarize(number_of_rides = length(ID))

riding_group_size

# export
write.csv(riding_group_size,
          "exports\\riding_group_size.csv" ,
          row.names = TRUE)


# member_type_length
# >>> member_type_length
member_type_length <-  df %>%
  group_by(member_casual) %>%
  summarise(avg_riding_time = mean(ridding_length))

member_type_length

# export
write.csv(member_type_length,
          "exports\\member_type_length.csv" ,
          row.names = TRUE)

# member_type_count
# >>> member_type_count
member_type_count <- df %>%
  group_by(member_casual) %>%
  summarize(number_of_rides = length(ID))

member_type_count

# export
write.csv(member_type_count,
          "exports\\member_type_count.csv" ,
          row.names = TRUE)

# member_avg_time_by_day
# >>> member_avg_time_by_day
member_avg_time_by_day <- df %>%
  group_by(day_of_ride, member_casual) %>%
  summarise(avg_riding_time
            = mean(ridding_length))
member_avg_time_by_day

# export
write.csv(member_avg_time_by_day,
          "exports\\member_avg_time_by_day.csv" ,
          row.names = TRUE)


# member_avg_time_by_month
# >>> member_avg_time_by_month
member_avg_time_by_month <- df %>%
  group_by(month_of_ride, member_casual) %>%
  summarise(avg_riding_time
            = mean(ridding_length))
member_avg_time_by_month

# export
write.csv(member_avg_time_by_month,
          "exports\\member_avg_time_by_month.csv" ,
          row.names = TRUE)


# member_avg_time_by_week
# >>> member_avg_time_by_week
member_avg_time_by_week <- df %>%
  group_by(week_of_ride, member_casual) %>%
  summarise(avg_riding_time
            = mean(ridding_length))

member_avg_time_by_week

# export
write.csv(member_avg_time_by_week,
          "exports\\member_avg_time_by_week.csv" ,
          row.names = TRUE)


# member_avg_time_by_day
# member_avg_time_by_day >>>
member_avg_time_by_day <-
  df %>% group_by(as.numeric(strftime(started_at, format = "%j"))
                  , member_casual) %>% summarise(
                    avg_riding_time = mean(ridding_length))

member_avg_time_by_day

# export
write.csv(member_avg_time_by_day,
          "exports\\member_avg_time_by_day.csv" ,
          row.names = TRUE)


# geo movement
# member_location_activity
member_location <- df %>%
  filter(start_station_name != "") %>%
  select(start_station_name, member_casual) %>%
  table()
member_location
# export
write.csv(member_location,
          "exports\\member_location.csv" ,
          row.names = TRUE)


# export_all_df_data
df_sample_1000 <- data.frame(sample_n(df, 100000))

write.csv(df_sample_1000,
          "exports\\df_sample_1000.csv" ,
          row.names = TRUE)

write.csv(df,
          "exports\\df.csv" ,
          row.names = TRUE)
