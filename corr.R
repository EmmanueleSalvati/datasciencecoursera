corr <- function(directory, threshold = 0) {

        # 1. Function to slice a data.frame with complete cases only, if above
        # threshold
        get_complete <- function(dataframe) {
                complete_vec <- complete.cases(dataframe)
                dataframe[complete_vec, ]
        }
        
        # 2. Read all files in the directory, returns a vector with only
        # those monitors above threshold
        above_threshold <- function(directory) {
                files_vector <- list.files(directory, full.names = TRUE)
                return_vector <- c()
                for (monitor in files_vector) {
                        tmp_df <- read.csv(monitor)
                        complete_df <- get_complete(tmp_df)
                        if (nrow(complete_df) > threshold) {
                                return_vector <- c(return_vector, monitor)
                        }
                        rm(tmp_df)
                        rm(complete_df)
                }
                return_vector
        }

        # 3. Get correlations monitor per monitor, and put them in a vector
        get_corrs <- function(input_monitors) {
                cor_vector <- c()
                for (monitor in input_monitors) {
                        tmp_df <- read.csv(monitor)
                        complete_df <- get_complete(tmp_df)
                        corr <- cor(complete_df$sulfate, complete_df$nitrate)
                        cor_vector <- c(cor_vector, corr)
                        rm(tmp_df)
                        rm(complete_df)
                        rm(corr)
                }
                cor_vector
        }

        ret_vec <- above_threshold(directory)
        get_corrs(ret_vec)
}