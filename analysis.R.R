############################################
# Cyclistic Bike-Share Analysis
# Author: [Katherine Tang]
# Date: 2026
# Description: Analyze differences between casual riders and annual members
############################################

# --------------------
# Load Libraries
# --------------------

library(tidyverse)
library(lubridate)

# --------------------
# Load and Combine CSV Files
# --------------------

file_list <- list.files("data", full.names = TRUE)

rides <- file_list %>%
  map_df(read_csv)

# --------------------
# Data Cleaning and Feature Engineering
# --------------------

rides_clean <- rides %>%
  filter(!is.na(started_at), !is.na(ended_at)) %>%
  mutate(
    ride_length = as.numeric(difftime(ended_at, started_at, units = "mins")),
    day_of_week = wday(started_at, label = TRUE)
  ) %>%
  filter(ride_length >= 1)

# --------------------
# Standardize User Type Column
# --------------------

rides_clean <- rides_clean %>%
  mutate(
    user_type_clean = case_when(
      !is.na(member_casual) ~ member_casual,
      !is.na(usertype) & usertype == "Subscriber" ~ "member",
      !is.na(usertype) & usertype == "Customer" ~ "casual",
      TRUE ~ NA_character_
    )
  )

# --------------------
# Summary Statistics
# --------------------

# Average ride length by user type
avg_ride_length <- rides_clean %>%
  group_by(user_type_clean) %>%
  summarise(avg_ride_length = mean(ride_length))

print(avg_ride_length)

# --------------------
# Ride Counts by Day of Week
# --------------------

rides_by_day <- rides_clean %>%
  group_by(user_type_clean, day_of_week) %>%
  summarise(num_rides = n())

print(rides_by_day)

# --------------------
# Average Ride Length by Day and User Type
# --------------------

avg_length_by_day <- rides_clean %>%
  group_by(user_type_clean, day_of_week) %>%
  summarise(avg_ride_length = mean(ride_length))

print(avg_length_by_day)

# --------------------
# Visualizations
# --------------------

# Ride volume by day of week
ggplot(rides_clean, aes(x = day_of_week, fill = user_type_clean)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Number of Cyclistic Rides by Day of Week",
    x = "Day of Week",
    y = "Number of Rides",
    fill = "User Type"
  )

# Ride length distribution by user type
ggplot(rides_clean, aes(x = user_type_clean, y = ride_length, fill = user_type_clean)) +
  geom_boxplot() +
  labs(
    title = "Ride Length Distribution by User Type",
    x = "User Type",
    y = "Ride Length (Minutes)"
  )

