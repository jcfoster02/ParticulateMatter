#Course 4/Week 4 - Assignment
#
##   plot4.R
##
## September, 2016
## Julie Foster

#  Question 4:  Across the United States, how have emissions from coal combustion-
#   related sources changed from 1999-2008?

# Read in the data and subset on coal releated sources
#NEI <- readRDS("./data/summarySCC_PM25.rds")
#SCC <- readRDS("./data/Source_Classification_Code.rds")
subSCC <- subset(SCC, select=c(SCC, EI.Sector))
coal <- subSCC[grep("Coal$", subSCC$EI.Sector), ]
subNEI <- NEI[NEI$SCC %in% coal$SCC, ]

library(ggplot2)

# Create plot
png(file="plot4.png", width= 480, height = 480)

g <- ggplot(subNEI, aes(year, Emissions))
g + geom_point() + geom_smooth(method="lm", se=FALSE) + labs(title="Emissions from Coal Sources in the U.S.") + labs(x="Year")

dev.off()