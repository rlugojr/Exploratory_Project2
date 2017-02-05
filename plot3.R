
baltimoreEmissionsByType <- aggregate(Emissions ~ year + type, baltimoreData, sum)

ggplot(baltimoreEmissionsByType, aes(year, (Emissions/1000), color = type)) + geom_line(size = 2) + coord_cartesian(ylim = c(0,2.25)) + ylab("Total PM2.5 (Thousands)") + xlab("Year") + ggtitle("Emission Levels Over Time in Baltimore City, MD by Source Type") + ggsave("plot3.png")
