dataF <- read.table("../household_power_consumption.txt", 
                   header = T, 
                   sep = ";",
                   na.strings = "?")

data2 <- select


data1 <- read.table(pipe('grep "^[1-2]/2/2007" 
                         "../household_power_consumption.txt"'))