# The following code is used to reconstruct Plot 4 in README.md, and store the plot in the file plot4.png
# The data set is “Individual household electric power consumption Data Set” from UC Irvine Machine Learning Repository.

setwd("/Users/shengnanhuang/Documents/data/ExData_Plotting1/figure")    #set the working directory

library(data.table)      # subset and read the data with date in 1/2/2007 and 2/2/2007
acol<-fread("./household_power_consumption.txt",sep=";",select=c("Date"))
bcol<-acol[acol$Date=="1/2/2007"|acol$Date=="2/2/2007"]
first<-which(acol$Date=="1/2/2007")[1]
last<-tail(which(acol$Date=="2/2/2007"),n=1)
a<-read.table("./household_power_consumption.txt",sep=";",skip=grep("1/2/2007",readLines("./household_power_consumption.txt")),nrows=last-first+1)
time<-strptime(paste(a$V1,a$V2),format="%d/%m/%Y %H:%M:%S")

png(file="plot4.png", width=480,height=480,units="px")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
plot(time,a$V3,type="l",xlab="",ylab="Global Active Power")
plot(time,a$V5,type="l",xlab="daytime",ylab="Voltage")
plot(time,a$V7,type="l",xlab="",ylab="Energy sub metering")
lines(time,a$V8,col="red")
lines(time,a$V9,col="blue")
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),cex=1.0,xjust=0.8)
plot(time,a$V4,type="l",xlab="daytime",ylab="Global_reactive_power")   # draw the four diagrams
dev.off()  # close the device