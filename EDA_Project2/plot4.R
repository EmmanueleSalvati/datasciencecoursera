if (!exists("NEI")) {
        NEI <- readRDS("summarySCC_PM25.rds")
}

if (!exists("SCC")) {
        SCC <- readRDS("Source_Classification_Code.rds")
}

merged_df <- merge(NEI, SCC)
rm(NEI)
rm(SCC)

# subset by only Coal combustion-related sources
sub_df <- merged_df[grepl("Fuel Comb", merged_df$EI.Sector) &
                            grepl("Coal", merged_df$EI.Sector), ]

# group data frame by year
sum_df4 <- aggregate(Emissions ~ year, sub_df, sum)

library(ggplot2)
qplot(year, Emissions, data = sum_df4, ylab = "Emissions (ton)",
      main = "Emissions from coal combustion-related sources")

dev.copy(png, file = "plot4.png")
dev.off()