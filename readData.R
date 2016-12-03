library(sqldf)
library(lubridate)

df<- read.csv.sql("../household_power_consumption.txt",sep=";",
                  sql="select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
closeAllConnections()

df$Date <- dmy(df$Date)
df$Time <- hms(df$Time)

hist(df$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",main="Global Active Power")