if (!exists("NEI")) {
    NEI <- readRDS("summarySCC_PM25.rds")
}

library(data.table)
DT <- data.table(NEI)
rm(NEI)

sum_df3 <- DT[, sum(Emissions),
              by = list(type, year, fips == "24510")][fips==TRUE]

library(ggplot2)
qplot(year, log(V1), data = sum_df3, col = type, geom = c("point", "smooth"),
      ylab = "log(Total emissions) (ton)")

dev.copy(png, file = "plot3.png")
dev.off()
