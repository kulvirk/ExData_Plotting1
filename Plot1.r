data2<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

data3<-read.table(text=grep("^[1,2]/2/2007",readLines(file("household_power_consumption.txt")),value=TRUE),col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),header=TRUE,sep=";",na.strings="?")
hist(data3$Global_active_power,col='red',xlab='Global Active Power (Kilowatts)',ylab="Frequency",main='Global Active Power')
dev.copy(png,"Plot1.png")