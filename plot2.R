# R script to recreate Plot 2 in Course Project 1 of Exploratory Data Analysis

# Load data.table package and read in file using fread().
library("data.table")
dt <- fread("household_power_consumption.txt", na.strings="?")

# Convert character Date to class Date and subset on specified date range.
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")
dt2 <- dt[(dt$Date == "2007-02-01" | dt$Date == "2007-02-02"), ]
rm(dt)

# Combine data & time
datetime <- paste(dt2$Date, dt2$Time)
dt2$Date <- as.POSIXct(datetime)

# Plot 2
with(dt2, plot(Date, Global_active_power, type="l", xlab="", 
               ylab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()