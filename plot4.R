install.packages("data.table")
library("data.table")
getwd()
setwd("C:/Users/kathrynmcdonald/Desktop/Desktop Working Directory")
getwd()
list.files("C:/Users/kathrynmcdonald/Desktop/Desktop Working Directory")
unzip("exdata_data_household_power_consumption.zip")
##read full data
alldata<-read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
names(alldata)

##read subset within date range
subsetdata <- subset(alldata, Date %in% c("1/2/2007", "2/2/2007"))
subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")


##date / time
subsetdata1 <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$subsetdata1 <- as.POSIXct(subsetdata1)

##Plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subsetdata, {
  ##Top left (plot2)
  plot(Global_active_power~subsetdata1, type="l", 
       ylab="Global Active Power", xlab="")
  
  ##Top right
  plot(Voltage~subsetdata1, type="l", 
       ylab="Voltage", xlab="datetime")
  
  ##Bottom left (plot3)
  plot(Sub_metering_1~subsetdata1, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~subsetdata1,col='Red')
  lines(Sub_metering_3~subsetdata1,col='Blue')
  legend("topright", lty=1, col=c("black", "red", "blue"),
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.6)
  
  ##Bottom right
  plot(Global_reactive_power~subsetdata1, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})


##Export
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()