# Read data
data <- read.csv('household_power_consumption.txt',sep=";",na.strings="?")

# Convert Date column to R Date class

# data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# Get subset of data for date ranges 1/2/2007 to 2/2/2007
data <- data[data$DateTime>=strptime("1/2/2007 00:00:00","%d/%m/%Y %H:%M:%S") & data$DateTime<strptime("3/2/2007 00:00:00","%d/%m/%Y %H:%M:%S"), ]

# Plot
output=png(filename="plot3.png")
plot(data$DateTime, data$Sub_metering_1,type="l",main="",xlab="",ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2,type="l",col="red")
lines(data$DateTime, data$Sub_metering_3,type="l",col="blue")
legend('topright',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
dev.off()


