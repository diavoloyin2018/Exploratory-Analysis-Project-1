getwd()
setwd("E:/Data Science Specialisation/Exploratory Analysis/household_power_consumption")

file.info("household_power_consumption.txt")$size

rawData<-read.table("household_power_consumption.txt", sep = ";",header=TRUE,stringsAsFactors = FALSE,dec=".")

str(rawData)
head(rawData)

rawData$Date<-as.Date(rawData$Date,"%d/%m/%Y")
str(rawData)

plotData<-rawData[rawData$Date=="2007-02-01"|rawData$Date=="2007-02-02",]

plotData$datetime <- strptime(paste(plotData$Date, plotData$Time), "%Y-%m-%d %H:%M:%S")

plotData$datetime <- as.POSIXct(plotData$datetime)


png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2))

plotData$Sub_metering_1<-as.numeric(plotData$Sub_metering_1)
plotData$Sub_metering_2<-as.numeric(plotData$Sub_metering_2)
plotData$Sub_metering_3<-as.numeric(plotData$Sub_metering_3)
plotData$Voltage<-as.numeric(plotData$Voltage)

attach(plotData)

plot(Global_active_power ~ plotData$datetime, type = "l", ylab = "Global Active Power", 
    xlab = "")
plot(Voltage ~ plotData$datetime, type = "l")
plot(Sub_metering_1 ~ plotData$datetime, type = "l", ylab = "Energy sub metering", 
     xlab = "")
lines(Sub_metering_2 ~ plotData$datetime, col = "Red")
lines(Sub_metering_3 ~ plotData$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

plot(Global_reactive_power ~ plotData$datetime, type = "l")

dev.off()
