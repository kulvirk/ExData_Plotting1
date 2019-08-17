data <- read.table(text=grep("^[1,2]/2/2007",readLines(file("household_power_consumption.txt")),value=TRUE),col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),header=TRUE,sep=";",na.strings="?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png,"Plot2.png",height=480,width=480)