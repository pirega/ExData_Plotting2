## set work directory
setwd("FORMACION/Coursera/Exploratory_Data_Analysis/Assignment2/")


#2-Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#(fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
#plot answering this question.

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

MD <- subset(NEI, NEI$fips==24510)
Emissions <- aggregate(MD[, 'Emissions'], by=list(MD$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

png(file="plot2.png")
barplot(Emissions[,3], names.arg=Emissions[,1],main=paste0("Total Emission of PM2.5 in Baltimore City, Maryland"), xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()

