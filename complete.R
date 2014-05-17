complete <- function(directory, id = 1:332) {
    
    # 1. Read monitor files with ID = id only, returns a merged data.frame
    read_files <- function(directory, id = 1:332) {
        input_dir <- dir(directory)
        df <- data.frame()
        for (monitor in id) {
            tmp_csv_file <- paste(directory, input_dir[monitor], sep = '/')
            tmp_df <- read.csv(tmp_csv_file)
            df <- rbind(df, tmp_df)
            rm(tmp_csv_file)
            rm(tmp_df)
        }
        df
    }
     
    # 2. Slice the data.frame with complete cases only
    get_complete <- function(dataframe) {
        complete_vec <- complete.cases(dataframe)
        dataframe[complete_vec, ]
    }
    
    # 3. Create final summary data.frame
    get_summary_df <- function(dataframe, id) {
        factor_vec <- factor(c("id", "nobs"))
        id_vec <- c()
        nobs_vec <- c()
        for (monitor in id) {
            id_vec <- c(id_vec, monitor)
            nobs <- nrow(dataframe[dataframe$ID == monitor, ])
            nobs_vec <- c(nobs_vec, nobs)
        }
        m <- cbind(id_vec, nobs_vec)
        colnames(m) <- factor_vec
        final_df <- data.frame(m)
        final_df
    }
    
    # 4. Apply all the functions now
    df <- read_files(directory, id)
    comp_df <- get_complete(df)
    final_df <- get_summary_df(comp_df, id)
    final_df
}