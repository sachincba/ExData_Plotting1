hpcData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

twoDays <- subset(hpcData, hpcData$Date == '1/2/2007'|hpcData$Date == '2/2/2007')

twoDays$dateTime <- paste(twoDays$Date, twoDays$Time, sep = " ")

twoDays$dateTime <- strptime(twoDays$dateTime, "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))


temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp, mode="wb")
unzip(temp, "household_power_consumption.txt")

plot(twoDays$dateTime, twoDays$Global_active_power, type = 'l', 
     xlab = '', ylab = "Global Active Power (kilowatts)")
plot(twoDays$dateTime, twoDays$Voltage, type = 'l', 
     xlab = 'datetime', ylab = "Voltage")

plot(twoDays$dateTime, twoDays$Sub_metering_1, type = 'l', col='black',
     xlab = "",ylab = "Energy sub metering")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, bty = 'n', y.intersp = 0.2,col=c("black", "red", "blue"))
lines(twoDays$dateTime, twoDays$Sub_metering_2, col='red')
lines(twoDays$dateTime, twoDays$Sub_metering_3, col='blue')

plot(twoDays$dateTime, twoDays$Global_reactive_power, type = 'h', xlab = 'datetime', 
     ylab = 'Global_reactive_power')

dev.copy(png, 'plot4.png')

dev.off()