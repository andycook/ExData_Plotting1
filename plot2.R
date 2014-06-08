library(data.table)
testData <- data.table(read.table("./data//household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?"))
##df <- read.table("./data//household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")
newTest <- testData[(as.Date(testData$Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y")) | (as.Date(testData$Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y")),]
png(filename = "plot1.png")
hist(newTest$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
with(newTest, plot(strptime(paste(Date, Time, sep=" "),format='%d/%m/%Y %H:%M:%S'), 
                   Global_active_power), type="l")
##lines(x, y)
dev.off()