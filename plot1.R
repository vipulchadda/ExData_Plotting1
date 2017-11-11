fullData <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, na.strings="?", colClasses = "character")
relaventData1 <- subset(fullData, Date== "1/2/2007")
relaventData2 <- subset(fullData, Date== "2/2/2007")
relaventData <- rbind(relaventData1, relaventData2)
global_active_power <- as.numeric(relaventData$Global_active_power)
png("plot1.png")
hist(global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     border="black", 
     col="red",
     axes = FALSE)
axis(1, at=seq(0,6,by=2))
axis(2)
dev.off()