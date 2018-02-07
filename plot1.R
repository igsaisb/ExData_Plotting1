##Course: Cousera Exploratory Data Analysis commencing 5 February 2018
##Assignment: Week 1 Course Project, Plot 1
##Data Source: “Individual household electric power consumption Data Set” from UC Irvine Machine Learning Repository
##Data Source Description:      Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. 
                                ##Different electrical quantities and some sub-metering values are available.
##Data Source URL: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

##Reading the data source in. Assumes file in working directory.
##The command reads in a relevant subset of the file as given in the assignment and names the columns.
data2 <- read.table("household_power_consumption.txt",skip=66637,nrows = 2280,sep=";", 
                col.names = c("Date","Time","Global_active_power","Global_reactive_power",
                "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Generate histogram of Global Active Power and copy to .png format. 
plot1 <- hist(as.numeric(as.character(data2$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)

##Reset graphic device
dev.off() 