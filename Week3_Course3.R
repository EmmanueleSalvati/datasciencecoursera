question2 <- function() {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
        if (!file.exists("datasets")) {
                dir.create("datasets")
        }
        
        if (!file.exists("datasets/jeff.jpg")) {
                download.file(url=fileUrl, destfile="./datasets/jeff.jpg", method = "curl")
        }
}

question3 <- function() {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
        if (!file.exists("./datasets/GDP.csv")) {
                download.file(fileUrl, destfile="./datasets/GDP.csv", method="curl")
        }
        eduUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
        if (!file.exists("./datasets/FEDSTATS_Country.csv")) {
                download.file(eduUrl, destfile="./datasets/FEDSTATS_Country.csv", method="curl")
        }
        gdp <- read.csv("datasets/GDP.csv")
        edu <- read.csv("datasets/FEDSTATS_Country.csv")
}