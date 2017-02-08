library(ggplot2)
library(dplyr)
#set the wd first

household <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
household$Date<-as.Date(strptime(household$Date, "%d/%m/%Y"))
household_feb <- filter(household, Date == "2007-02-01" | Date == "2007-02-02" )
new_df<- mutate(household_feb, datetime = paste(Date, Time, sep = " "))
new_df$datetime <- strptime(new_df$datetime, "%Y-%m-%d %H:%M:%S")
plot(new_df$datetime, new_df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()