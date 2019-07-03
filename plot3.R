hpcData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

twoDays <- subset(hpcData, hpcData$Date == '1/2/2007'|hpcData$Date == '2/2/2007')

twoDays$dateTime <- paste(twoDays$Date, twoDays$Time, sep = " ")

twoDays$dateTime <- strptime(twoDays$dateTime, "%d/%m/%Y %H:%M:%S")

plot(twoDays$dateTime, twoDays$Sub_metering_1, type = 'l', col='black',
     xlab = "",ylab = "Energy sub metering")
lines(twoDays$dateTime, twoDays$Sub_metering_2, col='red')
lines(twoDays$dateTime, twoDays$Sub_metering_3, col='blue')

dev.copy(png, 'plot3.png')

dev.off()