library(ggplot2)
library(dplyr)
#set the wd first

household <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
household$Date<-as.Date(strptime(household$Date, "%d/%m/%Y"))
household_feb <- filter(household, Date == "2007-02-01" | Date == "2007-02-02" )
new_df<- mutate(household_feb, datetime = paste(Date, Time, sep = " "))
new_df$datetime <- strptime(new_df$datetime, "%Y-%m-%d %H:%M:%S")
png("plot3.png", width=480, height = 480)
plot(new_df$datetime, new_df$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(new_df$datetime, new_df$Sub_metering_2, col = "red")
lines(new_df$datetime, new_df$Sub_metering_3, col = "blue")
legend("topright",  
       lwd = c(1,1,1), col = c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()