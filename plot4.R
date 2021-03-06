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
png("project/plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(plotData, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power",xlab="datetime")
})

dev.off()
