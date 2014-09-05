## Question 1
question1 <- function() {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    if (!file.exists("datasets")) {
        dir.create("datasets")
    }
    
    if (!file.exists("./datasets/Housing_2006_Idaho.csv")) {
        download.file(fileUrl, destfile="./datasets/Housing_2006_Idaho.csv", method="curl")
        dateDownloaded <- date()
    }
    
    
    houses <- read.csv("datasets/Housing_2006_Idaho.csv")
    rich_houses <- houses[houses$VAL==24 & !(is.na(houses$VAL)), "VAL"]
    print(length(rich_houses))
}

## Question 3
question3 <- function() {
    excelUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
    if (!file.exists("./datasets/NaturalGas.xlsx")) {
        download.file(excelUrl, destfile="./datasets/NaturalGas.xlsx", method="curl")
        dateDownloaded <- date()
    }
    
    library(xlsx)
    dat <- read.xlsx('./datasets/NaturalGas.xlsx', sheetIndex=1, rowIndex=18:23, colIndex=7:15)
    print(sum(dat$Zip*dat$Ext,na.rm=T) )
}

## Question 4
question4 <- function() {
    xmlUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
    doc <- xmlTreeParse(xmlUrl, useInternal=TRUE)
    rootNode <- xmlRoot(doc)
    zip_codes <- c(xpathSApply(rootNode, "//zipcode", xmlValue))
    length(zip_codes[zip_codes=="21231"])
}

## Question 5
question5 <- function() {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
    if (!file.exists("./datasets/Housing_2006_Idaho2.csv")) {
        download.file(fileUrl, dest="./datasets/Housing_2006_Idaho2.csv", method="curl")
        dateDownloaded <- date()
    }
    my_file <- file(description="./datasets/Housing_2006_Idaho2.csv", open="r")
    
}