getwd()
setwd("E:/Data Science Specialisation/Exploratory Analysis/household_power_consumption")

file.info("household_power_consumption.txt")$size

rawData<-read.table("household_power_consumption.txt", sep = ";",header=TRUE,stringsAsFactors = FALSE,dec=".")

str(rawData)
head(rawData)

rawData$Date<-as.Date(rawData$Date,"%d/%m/%Y")
str(rawData)

plotData<-rawData[rawData$Date=="2007-02-01"|rawData$Date=="2007-02-02",]

globalActivePower <- as.numeric(plotData$Global_active_power)

png("plot1.png", width=480, height=480)

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


