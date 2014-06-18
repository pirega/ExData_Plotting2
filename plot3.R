## set work directory
setwd("FORMACION/Coursera/Exploratory_Data_Analysis/Assignment2/")
library(ggplot2)
#3-Of the four types of sources indicated by the type (point, nonpoint, onroad, 
#nonroad) variable, which of these four sources have seen decreases in emissions 
#from 1999-2008 for Baltimore City? Which have seen increases in emissions from 
#1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

MD <- subset(NEI, NEI$fips==24510)
MD$year <- as.factor(MD$year)

png('plot3.png')
ggplot(data=MD, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
        geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
        ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') +
        ggtitle('Emissions per Type in Baltimore City, Maryland') +
        geom_jitter(alpha=0.10)
dev.off()
