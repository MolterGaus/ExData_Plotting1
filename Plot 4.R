#read data
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

#format date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#select data 
subdata<-data[data$Date > "2007-1-31" & data$Date < "2007-2-3", ]

subdata$Time <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S", tz = "GMT")

#Change language for plotting dates to english

Sys.setlocale("LC_TIME", "English")

#multiple plots
par(mfrow = c(2, 2)) 

#plot 1
plot(subdata$Time, subdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#plot 2

plot(subdata$Time, as.numeric(subdata$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")

#plot 3

plot(subdata$Time, as.numeric(subdata$Sub_metering_1), type = "l", lty = 1, ylab = "Energy sub metering", xlab = "")

lines(subdata$Time, as.numeric(subdata$Sub_metering_2), type = "l", lty = 1, col = "red")

lines(subdata$Time, as.numeric(subdata$Sub_metering_3), type = "l", lty = 1, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

#plot 4

plot(subdata$Time, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#save plot

dev.copy(device = png, filename = 'plot4.png', width = 480, height  = 480)

dev.off()


