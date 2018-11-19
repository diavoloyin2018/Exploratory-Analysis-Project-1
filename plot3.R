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

png("plot3.png", width=480, height=480)

plotData$Sub_metering_1<-as.numeric(plotData$Sub_metering_1)
plotData$Sub_metering_2<-as.numeric(plotData$Sub_metering_2)
plotData$Sub_metering_3<-as.numeric(plotData$Sub_metering_3)

plot(plotData$Sub_metering_1 ~ plotData$datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(plotData$Sub_metering_2 ~ plotData$datetime, col = "Red")
lines(plotData$Sub_metering_3 ~ plotData$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
