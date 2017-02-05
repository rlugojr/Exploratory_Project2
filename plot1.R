
TotalByYear <- aggregate(Emissions ~ year, NEI, sum)

ggplot(TotalByYear, aes(year, (Emissions/1000000))) + geom_line(color="green", size =2) + coord_cartesian(ylim = c(3.5,7.5)) + ylab("Total PM2.5 (Millions)") + xlab("Year") + ggtitle("Emission Levels Over Time") + ggsave("plot1.png")
