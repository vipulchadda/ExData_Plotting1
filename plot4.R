fullData <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, na.strings="?", colClasses = "character")
relaventData1 <- subset(fullData, Date== "1/2/2007")
relaventData2 <- subset(fullData, Date== "2/2/2007")
relaventData <- rbind(relaventData1, relaventData2)
relaventData <- transform(relaventData, DateTime = strptime(paste(Date, Time),"%d/%m/%Y %H:%M:%S"))
global_active_power <- as.numeric(relaventData$Global_active_power)
png("plot4.png")
par(mfrow=c(2,2))
#Top left plot
plot(x = relaventData$DateTime, 
     y = global_active_power, 
     type = "n", 
     xlab = "", 
     ylab = "Global Active Power")
lines(relaventData$DateTime, global_active_power)

#Top right plot
plot(x = relaventData$DateTime, 
     y = as.numeric(relaventData$Voltage), 
     type = "n", 
     xlab = "datetime", 
     ylab = "Voltage")
lines(relaventData$DateTime, as.numeric(relaventData$Voltage))

#Bottom left plot
plot(x = relaventData$DateTime, 
     y = relaventData$Sub_metering_1, 
     type = "n", 
     xlab = "", 
     ylab = "Energy Sub metering")
lines(relaventData$DateTime, relaventData$Sub_metering_1, col = "black")
lines(relaventData$DateTime, relaventData$Sub_metering_2, col = "red")
lines(relaventData$DateTime, relaventData$Sub_metering_3, col = "blue")
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), bty = "n")

#Bottom right plot
plot(x = relaventData$DateTime, 
     y = relaventData$Global_reactive_power, 
     type = "n", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")
lines(relaventData$DateTime, relaventData$Global_reactive_power)
dev.off()