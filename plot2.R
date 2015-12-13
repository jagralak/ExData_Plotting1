dataFile <- "../../household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
DataSubSet <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

datetime <- strptime(paste(DataSubSet$Date, DataSubSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
DataSubSet$Global_active_power <- as.numeric(DataSubSet$Global_active_power)
png("plot2.png", width=480, height=480)
with(DataSubSet, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
