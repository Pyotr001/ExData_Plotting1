library(sqldf)
data <- read.csv.sql("../household_power_consumption.txt", 
                     header = T, 
                     sep = ";",
                     sql = "select * from file where Date = '1/2/2007' or Date='2/2/2007'"
)

library(lubridate)
data$date_time <- dmy_hms(paste(data$Date, " ", data$Time))

png("plot4.png")

par(mfrow = c(2,2))

# 1
plot(data$date_time, data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Pwer (kilowatts)"
     )

#2
plot(data$date_time, data$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage"
     )

#3
plot(data$date_time, data$Sub_metering_1,
     col = "black", 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub-metering"
     )

lines(data$date_time, data$Sub_metering_2, col = "red")
lines(data$date_time, data$Sub_metering_3, col = "blue")
legend("topright", 
       lwd = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_3",
                  "Sub_metering_2",
                  "Sub_metering_3")
       )

#4
plot(data$date_time, data$Global_reactive_power,
     col = "black", 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power"
     )

dev.off()