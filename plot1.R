## set work directory
setwd("FORMACION/Coursera/Exploratory_Data_Analysis/Assignment2/")


#You must address the following questions and tasks in your exploratory analysis. 
 #For each question/task you will need to make a single plot. Unless specified, 
 #you can use any plotting system in R to make your plot.

#1- Have total emissions from PM2.5 decreased in the United States from 1999 to 
 #2008? Using the base plotting system, make a plot showing the total PM2.5 
 #emission from all sources for each of the years 1999, 2002, 2005, and 2008.


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

png(file="plot1.png")
barplot(Emissions[,3], names.arg=Emissions[,1],main=expression('Total Emission of PM'[2.5]), xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()
