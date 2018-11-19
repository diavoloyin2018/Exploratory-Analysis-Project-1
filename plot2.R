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

# Plot 2
plotData$datetime <- as.POSIXct(plotData$datetime)
attach(plotData)
globalActivePower <- as.numeric(plotData$Global_active_power)

png("plot2.png", width=480, height=480)

plot(globalActivePower ~ plotData$datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
detach(plotData)


