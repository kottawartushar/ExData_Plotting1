read_file <- read.table("household_power_consumption.txt", header = TRUE, 
                        sep = ";", stringsAsFactors = FALSE, na.strings = "?")
##head(read_file)
subsetDate_data <- subset(read_file, Date %in% c("1/2/2007", "2/2/2007"))
subsetDate_data$Date <- as.Date(subsetDate_data$Date, format = "%d/%m/%Y")
hist(subsetDate_data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power")
png("plot1.png", width = 480, height = 480)
dev.off()