## Code for Plot 3.

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
png(filename = ".\\ExData_Plotting1\\figure\\plot3.png", width = 480, height = 480)
plot(new_exdata_sub$dateandtime,new_exdata_sub$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
points(new_exdata_sub$dateandtime,new_exdata_sub$Sub_metering_2, type = "l", col = "red")
points(new_exdata_sub$dateandtime,new_exdata_sub$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)
dev.off()