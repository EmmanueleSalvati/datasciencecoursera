pollutantmean <- function(directory, pollutant, id = 1:332) {
    # 1. Retrieve all the data frames and return a merged data frame
    get_data_frames <- function(directory) {
        input_dir <- dir(directory)
        df <- data.frame()
        file_number <- 1
        while (file_number <= length(input_dir)) {
            tmp_csv_file <- paste(directory, input_dir[file_number], sep = "")
            tmp_df <- read.csv(tmp_csv_file)
            df <- rbind(df, tmp_df)
            file_number <- file_number + 1
        }
        df
    }

    
    
    # 2. Get the mean in a column
    nrow(df)
}