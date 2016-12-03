library(sqldf)
library(lubridate)

df<- read.csv.sql("../household_power_consumption.txt",sep=";",
                  sql="select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
closeAllConnections()



hist(df$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,filename="plot1.png",width=480,height=480)
dev.off()