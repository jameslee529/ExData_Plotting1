#Loading data
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", 
                   col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   nrows = 60 * 24 * 4, skip = 66600)

#convertint the Date and Time variables to Date/Time classes
data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subsetting 
data <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

#plot and send to PNG image file
Sys.setlocale(category = "LC_ALL", locale = "English")
with(data, plot(Time, Global_active_power, type = "l" , xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off() 