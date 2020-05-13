dataset <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

dataset <- dataset[dataset$Date>="2007-02-01" & dataset$Date<="2007-02-02", ]

dataset$Time <- paste(dataset$Date, dataset$Time, sep = " ")
dataset$Time <- strptime(dataset$Time, format = "%Y-%m-%d %H:%M:%S")

png(filename="./plot3.png", width = 480, height = 480, units = "px", bg = "white")
plot(dataset$Time, dataset$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(dataset$Time, dataset$Sub_metering_2, col = "red", type = "l")
lines(dataset$Time, dataset$Sub_metering_3, col = "blue", type = "l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), lty=1, ncol=1)
dev.off()
# My plot has Spanish labels in the X axis; if you were to run this on your PC you would get 
# labels in your language.