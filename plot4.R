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

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

## NW
plot(data$Time, data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

## NE
plot(data$Time,
     data$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

## SW
plot(data$Time,
     data$Sub_metering_1,
     type="l",
     col="black",
     xlab="",
     ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       bty="n")
## SE
plot(data$Time,
     data$Global_reactive_power,
     type="n",
     xlab="datetime",
     ylab="Global_reactive_power")
lines(data$Time, data$Global_reactive_power)

dev.off()
