# The following code is used to reconstruct Plot 2 in README.md, and store the plot in the file plot2.png
# The data set is “Individual household electric power consumption Data Set” from UC Irvine Machine Learning Repository.


setwd("/Users/shengnanhuang/Documents/data/ExData_Plotting1/figure")   #set the working directory

library(data.table)     # subset and read the data with date in 1/2/2007 and 2/2/2007
acol<-fread("./household_power_consumption.txt",sep=";",select=c("Date"))
bcol<-acol[acol$Date=="1/2/2007"|acol$Date=="2/2/2007"]
first<-which(acol$Date=="1/2/2007")[1]
last<-tail(which(acol$Date=="2/2/2007"),n=1)
a<-read.table("./household_power_consumption.txt",sep=";",skip=grep("1/2/2007",readLines("./household_power_consumption.txt")),nrows=last-first+1)
time<-strptime(paste(a$V1,a$V2),format="%d/%m/%Y %H:%M:%S")
plot(time,a$V3,type="l",xlab="",ylab="Global Active Power (kilowatts)")   #plot
dev.copy(png,file="plot2.png", width=480,height=480,units="px")   #copy the plot into a png file
dev.off()   # close the device