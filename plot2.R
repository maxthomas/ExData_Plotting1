DT <- fread('household_power_consumption.txt', 
            na.strings='?')
DT2 <- subset(DT, DT$Date == '2/2/2007' | DT$Date== '1/2/2007')
DT2$DateTime <- as.POSIXct(paste(DT2$Date, DT2$Time), 
                           format="%d/%m/%Y %H:%M:%S")
png(filename = 'plot2.png',
    width = 480, height = 480, units = 'px')
par(mar = c(4, 4, 4, 4), cex=0.8)
plot(DT2$DateTime, DT2$Global_active_power, 
     xlab = '', 
     ylab = "Global Active Power (kilowatts)", 
     type = 'l')
dev.off()