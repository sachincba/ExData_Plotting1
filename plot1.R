hpcData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

twoDays <- subset(hpcData, hpcData$Date == '1/2/2007'|hpcData$Date == '2/2/2007')

twoDays$dateTime <- paste(twoDays$Date, twoDays$Time, sep = " ")

twoDays$dateTime <- strptime(twoDays$dateTime, "%d/%m/%Y %H:%M:%S")

png('plot1.png')
plot1 <- hist(twoDays$Global_active_power)


plot(plot1, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     main = "Global Active Power", col = 'red')
dev.off()