# Read data
data <- read.csv('household_power_consumption.txt',sep=";",na.strings="?")

# Convert Date column to R Date class

# data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# Get subset of data for date ranges 1/2/2007 to 2/2/2007
data <- data[data$DateTime>=strptime("1/2/2007 00:00:00","%d/%m/%Y %H:%M:%S") & data$DateTime<strptime("3/2/2007 00:00:00","%d/%m/%Y %H:%M:%S"), ]

# Plot
output=png(filename="plot2.png")
plot(data$DateTime, data$Global_active_power,type="l",main="",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()

