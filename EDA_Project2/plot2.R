if (!exists("NEI")) {
    NEI <- readRDS("summarySCC_PM25.rds")
}

library(data.table)
DT <- data.table(NEI)
rm(NEI)

sum_df2 <- DT[, sum(Emissions), by = list(year, fips == "24510")][fips == TRUE]
plot(V1 ~ year, sum_df2, xlab = "year", ylab = "Total emissions (ton)")
dev.copy(png, file = "plot2.png")
dev.off()