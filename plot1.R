# The following code is used to reconstruct Plot 1 in README.md, and store the plot in the file plot1.png
# The data set is “Individual household electric power consumption Data Set” from UC Irvine Machine Learning Repository.

setwd("/Users/shengnanhuang/Documents/data/ExData_Plotting1/figure") #set the working directory

library(data.table)    # subset and read the data with date in 1/2/2007 and 2/2/2007
acol<-fread("./household_power_consumption.txt",sep=";",select=c("Date"))
bcol<-acol[acol$Date=="1/2/2007"|acol$Date=="2/2/2007"]
first<-which(acol$Date=="1/2/2007")[1]
last<-tail(which(acol$Date=="2/2/2007"),n=1)
a<-read.table("./household_power_consumption.txt",sep=";",skip=grep("1/2/2007",readLines("./household_power_consumption.txt")),nrows=last-first+1)

hist(a$V3, col = "red",xlab="Global Active Power (kilowatts)", main="Global Active Power") # draw the histogram
dev.copy(png,file="plot1.png", width=480,height=480,units="px")  #copy the plot into a png file
dev.off()  # close the device