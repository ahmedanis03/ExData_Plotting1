library(sqldf)
library(lubridate)

df<- read.csv.sql("../household_power_consumption.txt",sep=";",
                  sql="select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
closeAllConnections()

fullTime<-dmy_hms(paste(df$Date,df$Time))

plot(fullTime,df$Global_active_power,type="l",xlab = "",ylab = "Global Active Power (kilowatts)")
dev.copy(png,filename="plot2.png",width=480,height=480)
dev.off()