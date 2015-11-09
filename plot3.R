#This file will create the plot3.png file

#read in all the data
allData<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 2075259, stringsAsFactors = FALSE, na.strings = "?")

#clean up the dat variables
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")

#subset for necessary dates
plotData <- subset(allData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#creating datetime here since there's less data
datetime <- paste(as.Date(plotData$Date), plotData$Time)
plotData$Datetime <- as.POSIXct(datetime)

#get rid of allData
rm(allData)

#build the plot
png("project/plot3.png", width=480, height=480)
with(plotData, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
