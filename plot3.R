temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp, mode="wb")
unzip(temp, "household_power_consumption.txt")

hpcData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

twoDays <- subset(hpcData, hpcData$Date == '1/2/2007'|hpcData$Date == '2/2/2007')

twoDays$dateTime <- paste(twoDays$Date, twoDays$Time, sep = " ")

twoDays$dateTime <- strptime(twoDays$dateTime, "%d/%m/%Y %H:%M:%S")

plot(twoDays$dateTime, twoDays$Sub_metering_1, type = 'l', col='black',
     xlab = "",ylab = "Energy sub metering")
lines(twoDays$dateTime, twoDays$Sub_metering_2, col='red')
lines(twoDays$dateTime, twoDays$Sub_metering_3, col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))
dev.copy(png, 'plot3.png')

dev.off()