if (!exists("NEI")) {
        NEI <- readRDS("summarySCC_PM25.rds")
}

if (!exists("SCC")) {
        SCC <- readRDS("Source_Classification_Code.rds")
}

if (!exists("merged_df")) {
        merged_df <- merge(NEI, SCC)
}
rm(NEI)
rm(SCC)

# subset data frame by Vehicle sources and Baltimore or Los Angeles County
sub_df <- merged_df[grepl("Vehicle", merged_df$EI.Sector) &
                            (merged_df$fips == "24510" |
                                     merged_df$fips == "06037"), ]

# group data frame by year and County
sum_df6 <- aggregate(Emissions ~ year + fips, sub_df, sum)

# rename fips into county
library(plyr)
sum_df6$fips <- revalue(sum_df6$fips, c("06037" = "Los Angeles",
                                        "24510" = "Baltimore"))
names(sum_df6) <- c("year", "county", "Emissions")

qplot(year, Emissions, data = sum_df6, col = county,
      geom = c("point", "smooth"))

dev.copy(png, file = "plot6.png")
dev.off()