# R script to recreate Plot 1 in Course Project 1 of Exploratory Data Analysis

# Load data.table package and read in file using fread().
library("data.table")
dt <- fread("household_power_consumption.txt", na.strings="?")

# Convert character Date to class Date and subset on specified date range.
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")
dt2 <- dt[(dt$Date == "2007-02-01" | dt$Date == "2007-02-02"), ]
rm(dt)

# Plot 1
hist(dt2$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()