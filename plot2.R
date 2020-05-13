dataset <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

dataset <- dataset[dataset$Date>="2007-02-01" & dataset$Date<="2007-02-02", ]

dataset$Time <- paste(dataset$Date, dataset$Time, sep = " ")
dataset$Time <- strptime(dataset$Time, format = "%Y-%m-%d %H:%M:%S")

png(filename="./plot2.png", width = 480, height = 480, units = "px", bg = "white")
plot(dataset$Time, dataset$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
# My plot has Spanish labels in the X axis; if you were to run this on your PC you would get 
# labels in your language.