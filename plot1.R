library(data.table)
if (!file.exists('household_power_consumption.txt')) {
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
                destfile = 'data.zip')
  unzip('data.zip')
}

DT <- fread('household_power_consumption.txt', 
            na.strings='?')
DT2 <- subset(DT, DT$Date == '2/2/2007' | DT$Date== '1/2/2007')
png(filename = 'plot1.png',
    width = 480, height = 480, units = 'px')
par(mar = c(4, 4, 4, 4), cex=0.8)
hist(DT2$Global_active_power, 
     main = "Global Active Power", col='red', 
     xlab = "Global Active Power (kilowatts)")
dev.off()
