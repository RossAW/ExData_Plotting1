plot4<-function(){
    
    Data<-fread("household_power_consumption.txt",na.strings = "?")
    
    SubData<-Data[as.Date(Data$Date,"%d/%m/%Y")>=as.Date("2007-02-01") &as.Date(Data$Date,"%d/%m/%Y")<= as.Date("2007-02-02"), ]
    
    TimeVector<-paste(SubData$Date,SubData$Time)
    TimeVector<-strptime(TimeVector, "%d/%m/%Y %H:%M:%S")
    
    par(mfrow = c(2,2))
    with(SubData,{
        plot(TimeVector,as.numeric(SubData$Global_active_power),type = "l", ylab = "Global Active Power (kilowatts)",xlab = "")
        
        plot(TimeVector,as.numeric(SubData$Voltage),type = "l",ylab = "Voltage",xlab = "datetime")
        
        plot(TimeVector,as.numeric(SubData$Sub_metering_1),type = "l", ylab = "Energy sub metering",xlab="")
        lines(TimeVector,as.numeric(SubData$Sub_metering_2),col="red")
        lines(TimeVector,as.numeric(SubData$Sub_metering_3),col="blue")
        LegendVector<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
        colourVector<-c("black","red","blue")
        legend("topright",legend = LegendVector,col = c(3,6,9))
        
        plot(TimeVector,as.numeric(SubData$Global_reactive_power),type = "l",ylab = "Global_reactive_power", xlab = "datetime")
    })
}