# R script to recreate Plot 4 in Course Project 1 of Exploratory Data Analysis

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

# Plot 4
# Save straight to png to avoid issue of legend text getting cut off
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# panel 1
with(dt2, plot(Date, Global_active_power, type="l", xlab="", 
               ylab="Global Active Power (kilowatts)"))

# panel 2
with(dt2, plot(Date, Voltage, type="l", xlab="datetime", ylab="Voltage"))

# panel 3
with(dt2, {plot(Date, Sub_metering_1, type="l", xlab="", 
                ylab="Energy sub metering")
        lines(Date, Sub_metering_2, col="red")
        lines(Date, Sub_metering_3, col="blue")
})
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1, lwd=2, bty="n")

# panel 4
with(dt2, plot(Date, Global_reactive_power, type="l", xlab="datetime",
               ylab="Global_reactive_power"))

#dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()