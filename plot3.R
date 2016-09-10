#Course 4/Week 4 - Assignment
#
##   plot3.R
##
## September, 2016
## Julie Foster

#  Question 3:  Of the four types of sources indicated by the type(point,
#   nonpoint, onroad, nonroad) variable, which of these four sources have
#   seen decreases in emissions from 1999-2008 for Baltimore City?
#   Which hav seen increases in emissions from 1999-2008?
##      Use the ggplot2 plotting system to make a plot answering 
##      this question.

# Read in the data and subset to Baltimore City
#NEI <- readRDS("./data/summarySCC_PM25.rds")
balt <- subset(NEI, fips == "24510")

library(ggplot2)

# Create plot
png(file="plot3.png", width= 480, height = 480)

g <- ggplot(balt, aes(year, Emissions))
g + geom_point() + facet_grid(.~type) + geom_smooth(method="lm", se=FALSE) + labs(title="Baltimore City, Maryland Emissions By Type") + labs(x="Year")

dev.off()
