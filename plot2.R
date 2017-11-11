fullData <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, na.strings="?", colClasses = "character")
relaventData1 <- subset(fullData, Date== "1/2/2007")
relaventData2 <- subset(fullData, Date== "2/2/2007")
relaventData <- rbind(relaventData1, relaventData2)
relaventData <- transform(relaventData, DateTime = strptime(paste(Date, Time),"%d/%m/%Y %H:%M:%S"))
global_active_power <- as.numeric(relaventData$Global_active_power)
png("plot2.png")
plot(x = relaventData$DateTime, 
     y = global_active_power, 
     type = "n", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
lines(relaventData$DateTime, global_active_power)
dev.off()