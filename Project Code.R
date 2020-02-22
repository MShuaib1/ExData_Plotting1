library(lubridate)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(grid)
library(gridExtra)
library(reshape2)
# Load the data set
data = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##Exploring data
str(data)
dim(data)
head(data)

##Transforming date and subsetting
DP <- tbl_df(data)
PD <- filter(DP, Date == "1/2/2007" | Date == "2/2/2007")
PD <- mutate(PD, Date_Time = paste(Date, Time, sep = " "))
PD$Date_Time <- dmy_hms(PD$Date_Time)
PD[, 3:9] <- lapply(PD[, 3:9], as.numeric)
PD <- PD[, c(10,3:9)]

PDD <- PD[, c(1, 6:8)]
PDD$Date_Time <- as.character(PDD$Date_Time)
PDmelt <- melt(PDD, id.vars = "Date_Time")
PDmelt$Date_Time <- ymd_hms(PDmelt$Date_Time)
