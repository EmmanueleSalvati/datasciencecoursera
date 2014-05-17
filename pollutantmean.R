pollutantmean <- function(directory, pollutant, id = 1:332) {
        # 1. Retrieve all the data frames and return a merged data frame
        get_data_frames <- function(directory) {
                input_dir <- dir(directory)
                df <- data.frame()
                file_number <- 1
                #         while (file_number <= length(input_dir)) {
                while (file_number <= 5) {
                        tmp_csv_file <- paste(directory, input_dir[file_number], sep = "")
                        tmp_df <- read.csv(tmp_csv_file)
                        df <- rbind(df, tmp_df)
                        file_number <- file_number + 1
                }
                df
        }
        
        # 2. Get the mean in a column
        get_mean <- function(dataframe, pollutant, id = 1) {
                condition <- dataframe$ID == id
                column <- dataframe[condition, pollutant]
                mean(column, na.rm = TRUE)
        }
        
        df <- get_data_frames(directory)
        get_mean(df, pollutant, id)
        # print(nrow(df))
        # print(names(df))
        # print(pollutant)
        # print(class(df$ID))
        condition <- df$ID == 2 | df$ID == 1
        # print(class(condition))
        # nrow(df[condition, c(pollutant, "ID")])
        print(id)
        my_cond <- c(df$ID[df$ID == id])
        nrow(df[my_cond, pollutant])
}