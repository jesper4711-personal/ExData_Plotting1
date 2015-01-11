## format of the data
classes=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
## read in the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",colClasses = classes, na="?")               

## need the times converted for the plotting
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
## convert dates to take subset of data
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## only use two days worth of data
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)

png("plot2.png", width=480, height=480)

plot(data$Time,
     data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()
