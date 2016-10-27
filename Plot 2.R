#read data
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

#format date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#select data 
subdata<-data[data$Date > "2007-1-31" & data$Date < "2007-2-3", ]

subdata$Time <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%Y-%m-%d %H:%M:%S", tz = "GMT")

#Change language for plotting dates to english

Sys.setlocale("LC_TIME", "English")

plot(subdata$Time, subdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(device = png, filename = 'plot2.png', width = 480, height  = 480)

dev.off()