dataset <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

dataset <- dataset[dataset$Date>="2007-02-01" & dataset$Date<="2007-02-02", ]

dataset$Time <- paste(dataset$Date, dataset$Time, sep = " ")
dataset$Time <- strptime(dataset$Time, format = "%Y-%m-%d %H:%M:%S")

png(filename="./plot1.png", width = 480, height = 480, units = "px", bg = "white")
hist(dataset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()