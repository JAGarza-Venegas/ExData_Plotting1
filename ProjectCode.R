## Course 4 Week 1 Project

rm(list = ls())
## Complete dataset
## exdata <- read.table(".\\household_power_consumption.txt", header = TRUE, sep = ";")

## Read a subset of the dataset.
## First, get the column names by reading just the first row of the dataset.
Names <- read.table(".\\household_power_consumption.txt", header = TRUE,nrows = 1, sep = ";")
exdata_sub <- read.table(text = grep("(^[1-2])/2/2007",readLines(".\\household_power_consumption.txt"), value = TRUE), col.names = colnames(Names), sep=";")

