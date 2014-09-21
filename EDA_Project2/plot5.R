if (!exists(NEI)) {
        NEI <- readRDS("summarySCC_PM25.rds")
}

if (!exists(SCC)) {
        SCC <- readRDS("Source_Classification_Code.rds")
}

merged_df <- merge(NEI, SCC)
rm(NEI)
rm(SCC)

# subset data frame by Vehicle sources and Baltimore
sub_df <- merged_df[grepl("Vehicle", merged_df$EI.Sector) &
                            merged_df$fips == "24510", ]

# group data frame by year
sum_df5 <- aggregate(Emissions ~ year, sub_df, sum)

library(ggplot2)
qplot(year, Emissions, data = sum_df5, ylab = "Emissions (ton)",
      main = "Emissions from motor vehicle sources in Baltimore City")

dev.copy(png, file = "plot4.png")
dev.off()