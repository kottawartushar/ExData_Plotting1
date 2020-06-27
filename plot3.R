read_file <- read.table("household_power_consumption.txt", header = TRUE, 
                        sep = ";", stringsAsFactors = FALSE, na.strings = "?")
##head(read_file)
subsetDate_data <- subset(read_file, Date %in% c("1/2/2007", "2/2/2007"))
subsetDate_data$Date <- as.Date(subsetDate_data$Date, format = "%d/%m/%Y")
subsetDate_data$date_time <- as.POSIXct(paste(subsetDate_data$Date, subsetDate_data$Time))
plot(subsetDate_data$date_time, subsetDate_data$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(subsetDate_data$date_time, subsetDate_data$Sub_metering_2, type = "l",
      ylab = "Energy sub metering", col = "red")
lines(subsetDate_data$date_time, subsetDate_data$Sub_metering_3, type = "l",
      ylab = "Energy sub metering", col = "blue")
legend("topright", lty = 1, bty = "o", cex = 0.6,
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()