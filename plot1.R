## format of the data
classes=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
## read in the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",colClasses = classes, na="?")               

## convert dates to take subset
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## only use two days worth of data
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)

png("plot1.png", width=480, height=480)

hist(data$Global_active_power,
     ylim=c(0, 1200),
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")
dev.off()
