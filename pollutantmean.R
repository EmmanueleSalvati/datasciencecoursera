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
                        rm(tmp_df)
                        rm(tmp_csv_file)
                }
                df
        }
        
        # 2. Slice the data frame by id
        get_by_id <- function(dataframe, monitors_vector = 1) {
            df <- data.frame()
            for(monitor in monitors_vector) {
                tmp_df <- dataframe[dataframe$ID == monitor, ]
                df <- rbind(df, tmp_df)
            }
            df
        }
        
        # 3. Get the mean in a column
        get_mean <- function(dataframe, pollutant) {
                pollutant_column <- dataframe[, pollutant]
                full_mean <- mean(pollutant_column, na.rm = TRUE)
                round(full_mean[1], 3)
        }
        
        # 4. Now use the functions
        df <- get_data_frames(directory)
        selected_monitors_df <- get_by_id(df, id)
        get_mean(selected_monitors_df, pollutant)
        
}