fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
if (!file.exists("datasets")) {
        dir.create("datasets")
}

if (!file.exists("./datasets/Housing_2006_Idaho.csv")) {
        download.file(fileUrl, destfile="./datasets/Housing_2006_Idaho.csv", method="curl")
        dateDownloaded <- date()
}