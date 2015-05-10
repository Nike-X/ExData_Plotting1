# Use sqldf package for reading file
testdata <- read.csv.sql("household_power_consumption.txt",
                         "select * from file where date = '1/2/2007' or date = '2/2/2007'",
                         sep = ';')
# Save histogram as png
png(file = 'plot1.png')
hist(testdata$Global_active_power, col='red', main = 'Global active power',
     xlab = 'Global active power (kilowatts)')
dev.off()
