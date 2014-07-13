# Read data
data <- read.csv('household_power_consumption.txt',sep=";",na.strings="?")

# Convert Date column to R Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Get subset of data for date ranges 1/2/2007 to 2/2/2007
data <- data[data$Date>=as.Date("1/2/2007","%d/%m/%Y") & data$Date<=as.Date("2/2/2007","%d/%m/%Y"), ]

# Plot Histogram
output=png(filename="plot1.png")
colors=c("red")
hist(data$Global_active_power,col=colors,main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
