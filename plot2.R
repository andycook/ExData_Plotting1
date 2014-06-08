library(data.table)
testData <- data.table(read.table("./data//household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?"))
newTest <- testData[(as.Date(testData$Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y")) | (as.Date(testData$Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y")),]
png(filename = "plot2.png")
hist(newTest$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
xVals<-strptime(paste(newTest$Date, newTest$Time, sep=" "),format='%d/%m/%Y %H:%M:%S')
yVals<-newTest$Global_active_power
plot(xVals, yVals, type="l", xlab="", ylab="Global Active Power (kilowatts)", main="")
dev.off()