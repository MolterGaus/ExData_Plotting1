#read data
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, dec=".")

#format date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#select data 
subdata<-data[data$Date > "2007-1-31" & data$Date < "2007-2-3", ]

subdata$Time <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S", tz = "GMT")

#Change language for plotting dates to english

Sys.setlocale("LC_TIME", "English")

plot(subdata$Time, as.numeric(subdata$Sub_metering_1), type = "l", lty = 1, ylab = "Energy sub metering", xlab = "")

lines(subdata$Time, as.numeric(subdata$Sub_metering_2), type = "l", lty = 1, col = "red")

lines(subdata$Time, as.numeric(subdata$Sub_metering_3), type = "l", lty = 1, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2)

dev.copy(device = png, filename = 'plot3.png', width = 480, height  = 480)

dev.off()
