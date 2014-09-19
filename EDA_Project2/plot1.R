if (!exists("NEI")) {
    NEI <- readRDS("summarySCC_PM25.rds")
}

library(data.table)
DT <- data.table(NEI)
rm(NEI)

sums_df <- DT[, sum(Emissions), by = year]
plot(V1 ~ year, sums_df, xlab = "year", ylab = "Total emissions (ton)")
dev.copy(png, file = "plot1.png")
dev.off()
## Total emissions have decreased over the years