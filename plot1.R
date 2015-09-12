library(sqldf)
data <- read.csv.sql("../household_power_consumption.txt", 
             header = T, 
             sep = ";",
             ## na.strings = "?",
             sql = "select * from file where Date = '1/2/2007' or Date='2/2/2007'"
             )
png("plot1.png") # 480x480 - default value

hist(data$Global_active_power, 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
