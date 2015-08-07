
plot1<-function(){
    
    Data<-fread("household_power_consumption.txt",na.strings = "?")
    
    SubData<-Data[as.Date(Data$Date,"%d/%m/%Y")>=as.Date("2007-02-01") &as.Date(Data$Date,"%d/%m/%Y")<= as.Date("2007-02-02"), ]
    
    hist(as.numeric(SubData$Global_active_power),xlab = "Global Active Power(kW)",ylab = "Frequency",main = "Global Active Power",col = "red")
    
    
    
}