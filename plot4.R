data <- read.table("household_power_consumption.txt", sep = ";", header = T)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_intensity <- as.numeric(as.character(data$Global_intensity))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$complete_date <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png")

par(mfrow = c(2,2))
plot(data$complete_date, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

plot(data$complete_date, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(data$complete_date, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(data$complete_date, data$Sub_metering_2, type = "l", col = "red")
points(data$complete_date, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", bty = "n", lty = 1, cex = 0.75, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$complete_date, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off() 