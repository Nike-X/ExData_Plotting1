# Use sqldf package for reading file
testdata <- read.csv.sql("household_power_consumption.txt",
                         "select * from file where date = '1/2/2007' or date = '2/2/2007'",
                         sep = ';')
# Convert date
testdata$Date <- paste(testdata[,1],testdata[,2])
testdata$Date <- strptime(testdata$Date, format="%d/%m/%Y %H:%M:%S")
# Save plot in png file
png(file = 'plot3.png')
plot(testdata$Date, testdata$Sub_metering_1,type = "n", xlab = "", ylab ="Energy sub metering")
lines(testdata$Date, testdata$Sub_metering_1, type="l", col="black")
lines(testdata$Date, testdata$Sub_metering_2, type="l",col = "red")
lines(testdata$Date, testdata$Sub_metering_3, type="l",col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1),
       col=c("black", "red", "blue"))
dev.off()