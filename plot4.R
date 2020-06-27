read_file <- read.table("household_power_consumption.txt", header = TRUE, 
                        sep = ";", stringsAsFactors = FALSE, na.strings = "?")

subsetDate_data <- subset(read_file, Date %in% c("1/2/2007", "2/2/2007"))
subsetDate_data$Date <- as.Date(subsetDate_data$Date, format = "%d/%m/%Y")
subsetDate_data$date_time <- as.POSIXct(paste(subsetDate_data$Date, subsetDate_data$Time))

par(mfrow = c(2,2), mar = c(4,4,2,1))

plot(subsetDate_data$date_time, subsetDate_data$Global_active_power, type = "l", xlab = " ",
     ylab = "Global Active Power (kilowatts)")
plot(subsetDate_data$date_time, subsetDate_data$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")
plot(subsetDate_data$date_time, subsetDate_data$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(subsetDate_data$date_time, subsetDate_data$Sub_metering_2, type = "l",
      ylab = "Energy sub metering", col = "red")
lines(subsetDate_data$date_time, subsetDate_data$Sub_metering_3, type = "l",
      ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, bty = "o", cex = 0.4,
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"))
plot(subsetDate_data$date_time, subsetDate_data$Global_reactive_power, type = "l", 
     xlab = "datetime",ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
