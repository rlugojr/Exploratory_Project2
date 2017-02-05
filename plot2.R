
baltimoreData <- subset(NEI,fips == "24510")
baltimoreEmissions <- aggregate(Emissions ~ year, baltimoreData, sum)

ggplot(baltimoreEmissions, aes(year, (Emissions/1000))) + geom_line(color = "green", size = 2) + coord_cartesian(ylim = c(1.5,3.5)) + ylab("Total PM2.5 (Thousands)") + xlab("Year") + ggtitle("Emission Levels Over Time in Baltimore, MD") + ggsave("plot2.png")
