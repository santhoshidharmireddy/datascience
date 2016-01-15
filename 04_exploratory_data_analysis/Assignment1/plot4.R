rm(list = ls())
setwd("C:/Users/sdharmireddi/Desktop")
dt = read.table("household_power_consumption.txt",header=TRUE,sep=";")
dt$datetime = paste(dt$Date, dt$Time)
dt$datetime = strptime(dt$datetime, format="%d/%m/%Y %H:%M:%S")
dt$Date = as.character(dt$Date)
newdata <- subset(dt, dt$Date == "1/2/2007" | dt$Date == "2/2/2007")

par(mfrow = c(2,2))
dataforplot41<- gsub(",", "", newdata$Global_active_power)
dataforplot41<- as.numeric(dataforplot41)
plot(x=newdata$datetime,y=dataforplot41,type="l",xlab="",ylab="Global Active Power (Kilowatts)",mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))


dataforplot42<- gsub(",", "", newdata$Voltage)
dataforplot42<- as.numeric(dataforplot42)
plot(x=newdata$datetime,y=dataforplot42,type="l",ylab="Voltage",xlab="datetime")

dataforplot431<- gsub(",", "", newdata$Sub_metering_1)
dataforplot432<- gsub(",", "", newdata$Sub_metering_2)
#dataforplot33<- gsub(",", "", newdata$Sub_metering_3)
dataforplot433<- newdata$Sub_metering_3
dataforplot431<- as.numeric(dataforplot431)
dataforplot432<- as.numeric(dataforplot432)
#dataforplot33<- as.numeric(dataforplot33)
dataforplot43<- cbind(dataforplot431,dataforplot432,dataforplot433)

plot(x=newdata$datetime, dataforplot43[,1],type = "l",ylim=c(0,38),xlab="",ylab="Energy sub metering")
lines(x=newdata$datetime,dataforplot43[,2],type = "l",col="red")
lines(x=newdata$datetime,dataforplot43[,3],type = "l",col="blue")
legend("topright",col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lwd=2,lty=c(1,1,1),pt.cex=1,cex = 0.5,bty="n")

dataforplot44<- gsub(",", "", newdata$Global_reactive_power)
dataforplot44<- as.numeric(dataforplot44)
plot(x=newdata$datetime,y=dataforplot44,type="l",ylab="Global_Active_Power",xlab="datetime")
dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off()
