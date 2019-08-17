data <- read.table(text=grep("^[1,2]/2/2007",readLines(file("household_power_consumption.txt")),value=TRUE),col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),header=TRUE,sep=";",na.strings="?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2),mar=c(4,4,2,2),oma=c(0,0,2,1))
plot(data$Global_active_power ~data$Datetime,type="l",xlab="Global Active power")
plot(data$Datetime,data$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(data$Sub_metering_1 ~ data$Datetime, type = "l",ylab = "Energy Sub Metering (kilowatts)", xlab = "")
lines(data$Datetime,data$Sub_metering_2,col='red')
lines(data$Datetime,data$Sub_metering_3,col='blue')

plot(data$Datetime,data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.copy(png,"Plot4.png",height=480,width=480)