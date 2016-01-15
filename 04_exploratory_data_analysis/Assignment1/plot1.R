
rm(list = ls())
setwd("C:/Users/sdharmireddi/Desktop")
dt = read.table("household_power_consumption.txt",header=TRUE,sep=";")
dt$datetime = paste(dt$Date, dt$Time)
dt$datetime = strptime(dt$datetime, format="%d/%m/%Y %H:%M:%S")
dt$Date = as.character(dt$Date)
newdata <- subset(dt, dt$Date == "1/2/2007" | dt$Date == "2/2/2007")
dataforplot1<- gsub(",", "", newdata$Global_active_power)
dataforplot1<- gsub(",", "", newdata$Global_active_power)
dataforplot1<- as.numeric(dataforplot1)
par(mfrow = c(1, 1))
hist(dataforplot1,col=2,xlab="Global Active Power (Kilowatts)",main="Global Active Power")
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off()

