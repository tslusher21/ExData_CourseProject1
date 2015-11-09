#This file will create the plot2.png file
#This is a line chart of global active power by day (thu, fri)

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
png("project/plot2.png", width=480, height=480)
plot(plotData$Global_active_power~plotData$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
