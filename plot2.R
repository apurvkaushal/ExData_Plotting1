powdat<-read.table("housepow.txt",sep=";",header=TRUE)
date1<-subset(powdat,Date=="1/2/2007")
date2<-subset(powdat,Date=="2/2/2007")
finaldat<-rbind(date1,date2)
finaldat$Date<-as.Date(finaldat$Date,'%d/%m/%Y')
finaldat$Date_and_Time<-as.POSIXct(paste(finaldat$Date,finaldat$Time),format="%Y-%m-%d %H:%M:%S")
png(file="plot2.png",width=480,height=480)
plot(finaldat$Date_and_Time,as.numeric(finaldat$Global_active_power)/1000,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()