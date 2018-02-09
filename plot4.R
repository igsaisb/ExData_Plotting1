##Course: Cousera Exploratory Data Analysis commencing 5 February 2018
##Assignment: Week 1 Course Project, Plot 2
##Data Source:  “Individual household electric power consumption Data Set” from 
##              UC Irvine Machine Learning Repository
##Data Source Description:      Measurements of electric power consumption in 
##                              one household with a one-minute sampling rate 
##                              over a period of almost 4 years. 
##Different electrical quantities and some sub-metering values are available.
##Data Source URL: 
##https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

##Reading the data source in  Assumes file in working directory.
data.all <- read.csv("household_power_consumption.txt", header=T, sep=';', 
                      na.strings="?",nrows=2075259, check.names=F, 
                      stringsAsFactors=F, comment.char="", quote='\"')

##Subset to assigned dates.
data1 <- subset(data.all, Date %in% c("1/2/2007","2/2/2007"))

##Transforming date and time formats to allow for proper formatting.
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

##Set up grid for plots.
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

##Generate the required plots. 
with(data1, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="datetime")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               y.intersp = 0.5, cex =0.6)
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="datetime")
})

##Copy plot to .png format.
dev.copy(png, file="plot4.png", height=480, width=480)

##Reset graphic device
dev.off()
