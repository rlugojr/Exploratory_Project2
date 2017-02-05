
coalCombSCC <- filter(SCC, grepl("Coal", SCC$EI.Sector)) %>% select(SCC)

coalCombData <- filter (NEI, NEI$SCC %in% coalCombSCC$SCC)

ggplot(coalCombData, aes(factor(year), Emissions, color=type)) + geom_point(position = position_dodge(0.5)) + ggtitle("Emissions from Coal Sources") + xlab("Year")


