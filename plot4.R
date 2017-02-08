library(ggplot2)
library(dplyr)
#set the wd first

household <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
household$Date<-as.Date(strptime(household$Date, "%d/%m/%Y"))
household_feb <- filter(household, Date == "2007-02-01" | Date == "2007-02-02" )
new_df<- mutate(household_feb, datetime = paste(Date, Time, sep = " "))
new_df$datetime <- strptime(new_df$datetime, "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height = 480)
par(mfcol = c(2,2), mar = c(4,4,2,1), oma = c(1,1,2,1))
plot(new_df$datetime, new_df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="")

plot(new_df$datetime, new_df$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(new_df$datetime, new_df$Sub_metering_2, col = "red")
lines(new_df$datetime, new_df$Sub_metering_3, col = "blue")
legend("topright", lwd=1, legend=c("Sub_metering_1", 
                            "Sub_metering_2", 
                            "Sub_metering_3"), 
        col = c("black", "red", "blue"), 
        box.lwd=0, box.lty=0, border ="white", inset = 0.01:0.01)

plot(new_df$datetime, new_df$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(new_df$datetime, new_df$Global_reactive_power, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")
dev.off()