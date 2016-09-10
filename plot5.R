#Course 4/Week 4 - Assignment
#
##   plot5.R
##
## September, 2016
## Julie Foster

#  Question 5:  How have emissions from motor vehicle sources changed between 
#   1999-2008 in Baltimore City?

# Read in the data and subset to motor vehicle sources and Baltimore City
#NEI <- readRDS("./data/summarySCC_PM25.rds")
#SCC <- readRDS("./data/Source_Classification_Code.rds")
subSCC <- subset(SCC, select=c(SCC, EI.Sector))
table(subSCC$EI.Sector)
vehicles <- subSCC[grep("Vehicles$", subSCC$EI.Sector), ]
subNEI <- NEI[NEI$SCC %in% vehicles$SCC, ]
balt <- subset(subNEI, fips == "24510")

library(ggplot2)

# Create plot
png(file="plot5.png", width= 480, height = 480)

g <- ggplot(balt, aes(year, Emissions))
g + geom_point() + geom_smooth(method = "lm", se=FALSE) + labs(title="Emissions from Motor Vehicle Sources in Baltimore City") + labs(x="Year")

dev.off()