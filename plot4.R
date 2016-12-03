library(sqldf)
library(lubridate)

df<- read.csv.sql("../household_power_consumption.txt",sep=";",
                  sql="select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
closeAllConnections()

fullTime<-dmy_hms(paste(df$Date,df$Time))

par(mfcol=c(2,2))

plot(fullTime,df$Global_active_power,type="l",xlab = "",ylab = "Global Active Power (kilowatts)")


plot(fullTime,df$Sub_metering_1,type="n",xlab = "",ylab = "Energy sub metering")
axis(side = 2, lwd = 2)
points(fullTime,df$Sub_metering_1,type="l",col="black")
points(fullTime,df$Sub_metering_2,type="l",col="red")
points(fullTime,df$Sub_metering_3,type="l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1),col=c("black","red","blue"),xjust=1,yjust=1,x.intersp=0.5,y.intersp = 0.2,seg.len = 1,bty="n",
       inset = c(-0.17,-0.15))


plot(fullTime,df$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(fullTime,df$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")


dev.copy(png,filename="plot4.png",width=480,height=480)
dev.off()