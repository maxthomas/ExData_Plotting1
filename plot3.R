library(data.table)
if (!file.exists('household_power_consumption.txt')) {
  print ("Downloading data file.")
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
                destfile = 'data.zip')
  unzip('data.zip')
}
DT <- fread('household_power_consumption.txt', 
            na.strings='?')
DT2 <- subset(DT, DT$Date == '2/2/2007' | DT$Date== '1/2/2007')
DT2$DateTime <- as.POSIXct(paste(DT2$Date, DT2$Time), 
                           format="%d/%m/%Y %H:%M:%S")
png(filename = 'plot3.png',
    width = 480, height = 480, units = 'px')
par(mar = c(4, 4, 4, 4), cex=0.8)
plot(DT2$DateTime, DT2$Sub_metering_1, 
     xlab = '', 
     ylab = "Energy sub metering", 
     type = 'l')
lines(DT2$DateTime, DT2$Sub_metering_2, 
      col='red')
lines(DT2$DateTime, DT2$Sub_metering_3, 
      col='blue')
legend( x = 'topright',
        legend = c("Sub_metering_1",
                   "Sub_metering_2",
                   "Sub_metering_3"),
        col = c('black', 'red', 'blue'),
        lwd = 1)
dev.off()
