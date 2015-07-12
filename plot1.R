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

png(filename = "plot1.png")

with(data, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

dev.off() 







