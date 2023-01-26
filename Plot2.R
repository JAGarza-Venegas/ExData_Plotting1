## Code for Plot 2.

## Course 4 Week 1 Project

rm(list = ls())
library(dplyr)
library(lubridate)
# Necessary to change the names of the weekdays.
Sys.setlocale("LC_TIME","English")

## Read a subset of the dataset.
## First, get the column names by reading just the first row of the dataset.
Names <- read.table(".\\ExData_Plotting1\\household_power_consumption.txt", header = TRUE,nrows = 1, sep = ";")
exdata_sub <- read.table(text = grep("(^[1-2])/2/2007",readLines(".\\ExData_Plotting1\\household_power_consumption.txt"), value = TRUE), col.names = colnames(Names), sep=";")

new_exdata_sub <- mutate(exdata_sub, dateandtime = dmy_hms(paste(Date, Time)), .after = Time)

# Open the file device to write a png file. 
png(filename = ".\\ExData_Plotting1\\figure\\plot2.png", width = 480, height = 480)
plot(new_exdata_sub$dateandtime,new_exdata_sub$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l", lwd = 1.5)
dev.off()