#This file will create the plot1.png file
#This is a histogram of frequency vs. global active power(kilowatts)

#read in all the data
allData<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 2075259, stringsAsFactors = FALSE, na.strings = "?")

#clean up the dat variable
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")

#subset for necessary dates
plotData <- subset(allData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#get rid of allData
rm(allData)

#build the histogram
hist(plotData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#export it to a png file with the proper margins
## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()