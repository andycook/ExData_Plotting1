library(data.table)
testData <- data.table(read.table("./data//household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?"))
newTest <- testData[(as.Date(testData$Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y")) | (as.Date(testData$Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y")),]
png(filename = "plot3.png")
xVals <- strptime(paste(newTest$Date, newTest$Time, sep=" "),format='%d/%m/%Y %H:%M:%S')
yVals1 <- newTest$Sub_metering_1
yVals2 <- newTest$Sub_metering_2
yVals3 <- newTest$Sub_metering_3
plot(xVals, yVals1, type="n", xlab="", ylab="Energy sub metering", main="")
lines(xVals, yVals1)
lines(xVals, yVals2, col="red")
lines(xVals, yVals3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), inset = .0, col=c("black", "red", "blue"), lwd=1)
dev.off()