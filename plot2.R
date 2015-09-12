library(sqldf)
data <- read.csv.sql("../household_power_consumption.txt", 
                     header = T, 
                     sep = ";",
                     sql = "select * from file where Date = '1/2/2007' or Date='2/2/2007'"
)

library(lubridate)
data$date_time <- dmy_hms(paste(data$Date, " ", data$Time))

png("plot2.png")
plot(data$date_time, data$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "energy sub-metering")



dev.off()


## dev.copy(png, file = "plot2.png")

