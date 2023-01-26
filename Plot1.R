## Code for Plot 1.

## Course 4 Week 1 Project

rm(list = ls())
library(dplyr)
library(lubridate)

## Read a subset of the dataset.
## First, get the column names by reading just the first row of the dataset.
Names <- read.table(".\\ExData_Plotting1\\household_power_consumption.txt", header = TRUE,nrows = 1, sep = ";")
exdata_sub <- read.table(text = grep("(^[1-2])/2/2007",readLines(".\\ExData_Plotting1\\household_power_consumption.txt"), value = TRUE), col.names = colnames(Names), sep=";")

new_exdata_sub <- mutate(exdata_sub, dateandtime = dmy_hms(paste(Date, Time)), .after = Time)

# Open the file device to write a png file. 
png(filename = ".\\ExData_Plotting1\\figure\\plot1.png", width = 480, height = 480)
hist(new_exdata_sub$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()