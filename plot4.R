dataFile <- "../../household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
DataSubSet <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(DataSubSet$Date, DataSubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
DataSubSet$Global_active_power <- as.numeric(DataSubSet$Global_active_power)
DataSubSet$Global_reactive_power <- as.numeric(DataSubSet$Global_reactive_power)
DataSubSet$Voltage <- as.numeric(DataSubSet$Voltage)
DataSubSet$Sub_metering_1 <- as.numeric(DataSubSet$Sub_metering_1)
DataSubSet$Sub_metering_2 <- as.numeric(DataSubSet$Sub_metering_2)
DataSubSet$Sub_metering_3 <- as.numeric(DataSubSet$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, DataSubSet$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, DataSubSet$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, DataSubSet$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, DataSubSet$Sub_metering_2, type="l", col="red")
lines(datetime, DataSubSet$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, DataSubSet$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
