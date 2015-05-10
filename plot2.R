# Use sqldf package for reading file
testdata <- read.csv.sql("household_power_consumption.txt",
                         "select * from file where date = '1/2/2007' or date = '2/2/2007'",
                         sep = ';')
# Convert date
testdata$Date <- paste(testdata[,1],testdata[,2])
testdata$Date <- strptime(testdata$Date, format="%d/%m/%Y %H:%M:%S")
# Save plot in png file
png(file = 'plot2.png')
plot(testdata$Date, testdata$Global_active_power,type = "n", xlab = "", ylab = "Global active power (kilowatts)")
lines(testdata$Date, testdata$Global_active_power, type="l")
dev.off()