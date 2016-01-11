# R script to recreate Plot 3 in Course Project 1 of Exploratory Data Analysis

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

# Plot 3
# Save straight to png to avoid issue of legend text getting cut off
png("plot3.png", width=480, height=480)
with(dt2, {plot(Date, Sub_metering_1, type="l", xlab="", 
                ylab="Energy sub metering")
                lines(Date, Sub_metering_2, col="red")
                lines(Date, Sub_metering_3, col="blue")
})
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1, lwd=2)

#dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()