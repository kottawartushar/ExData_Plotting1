read_file <- read.table("household_power_consumption.txt", header = TRUE, 
                        sep = ";", stringsAsFactors = FALSE, na.strings = "?")
##head(read_file)
subsetDate_data <- subset(read_file, Date %in% c("1/2/2007", "2/2/2007"))
subsetDate_data$Date <- as.Date(subsetDate_data$Date, format = "%d/%m/%Y")
##subsetDate_data$Time <- strptime(subsetDate_data$Time, format = "%H:%M:%S")
subsetDate_data$date_time <- as.POSIXct(paste(subsetDate_data$Date, subsetDate_data$Time))
plot(subsetDate_data$date_time, subsetDate_data$Global_active_power, type = "l", xlab = " ",
     ylab = "Global Active Power (kilowatts)")
png("plot2.png", width = 480, height = 480)
dev.off()