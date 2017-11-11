fullData <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, na.strings="?", colClasses = "character")
relaventData1 <- subset(fullData, Date== "1/2/2007")
relaventData2 <- subset(fullData, Date== "2/2/2007")
relaventData <- rbind(relaventData1, relaventData2)
relaventData <- transform(relaventData, DateTime = strptime(paste(Date, Time),"%d/%m/%Y %H:%M:%S"))
global_active_power <- as.numeric(relaventData$Global_active_power)
png("plot3.png")
plot(x = relaventData$DateTime, 
     y = relaventData$Sub_metering_1, 
     type = "n", 
     xlab = "", 
     ylab = "Energy Sub metering")
lines(relaventData$DateTime, relaventData$Sub_metering_1, col = "black")
lines(relaventData$DateTime, relaventData$Sub_metering_2, col = "red")
lines(relaventData$DateTime, relaventData$Sub_metering_3, col = "blue")
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
dev.off()