temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp, mode="wb")
unzip(temp, "household_power_consumption.txt")

hpcData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

twoDays <- subset(hpcData, hpcData$Date == '1/2/2007'|hpcData$Date == '2/2/2007')

twoDays$dateTime <- paste(twoDays$Date, twoDays$Time, sep = " ")

twoDays$dateTime <- strptime(twoDays$dateTime, "%d/%m/%Y %H:%M:%S")

plot1 <- hist(twoDays$Global_active_power)


plot(plot1, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     main = "Global Active Power", col = 'red')
dev.copy(png, 'plot1.png')

dev.off()