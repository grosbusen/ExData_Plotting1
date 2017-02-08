library(ggplot2)
library(dplyr)
#set the wd first

household <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
household$Date<-as.Date(strptime(household$Date, "%d/%m/%Y"))
household_feb <- filter(household, Date == "2007-02-01" | Date == "2007-02-02" )
hist(household_feb$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()