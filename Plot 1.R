#read data
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

#format date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#select data 
subdata<-data[data$Date > "2007-1-31" & data$Date < "2007-2-3", ]

#ploting and save selected data
hist(as.numeric(subdata$Global_active_power)/1000, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

dev.copy(device = png, filename = 'plot1.png', width = 480, height  = 480)

dev.off()
