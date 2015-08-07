plot2<-function(){
    
Data<-fread("household_power_consumption.txt",na.strings = "?")
    
    SubData<-Data[as.Date(Data$Date,"%d/%m/%Y")>=as.Date("2007-02-01") &as.Date(Data$Date,"%d/%m/%Y")<= as.Date("2007-02-02"), ]

    TimeVector<-paste(SubData$Date,SubData$Time)
    TimeVector<-strptime(TimeVector, "%d/%m/%Y %H:%M:%S")
    
    plot(TimeVector,as.numeric(SubData$Global_active_power),type = "l", ylab = "Global Active Power (kilowatts)")
    

    
    
    
}