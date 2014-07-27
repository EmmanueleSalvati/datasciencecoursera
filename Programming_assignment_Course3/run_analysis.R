get_mean_and_std_vars <- function(vect) {
    ## Given the features vector, it returns a smaller vector with only
    ## means and std's
    std_grep <- grep("std\\(", vect, value=FALSE)
    mean_grep <- grep("mean\\(", vect, value=FALSE)
    cols_to_keep <- sort(c(mean_grep, std_grep))
    vect[cols_to_keep]
}

subset_df <- function(df) {
    ## Subsets a data.frame into mean and std's columns
    std_grep <- grep("std\\(", names(df), value=FALSE)
    mean_grep <- grep("mean\\(", names(df), value=FALSE)
    cols_to_keep <- sort(c(mean_grep, std_grep))
    subset(df, select = cols_to_keep)   
}

transform_activities <- function(file_string) {
    ## Function that takes the y_test(train) of activities and returns a vector
    ## of activity labels
    activity_labels <- read.table("activity_labels.txt")
    activities <- as.character(activity_labels[, "V2"])
    labels <- scan(file_string, what = integer(0))    
    rm(activity_labels)
    activity_labels <- c()
    for (i in seq_along(labels)) {
        activity_labels <- c(activity_labels, activities[labels[i]])
    }
    activity_labels
}


run_analysis <- function() {
    ## This is the main function, to be called after sourcing the file
    ## source('run_analysis.R')
    ## run_analysis()

    ## Load volunteers' files as data.frames
    people_test <- read.table("test/subject_test.txt")
    people_train <- read.table("train/subject_train.txt")
    
    ## Load train and test data.frames, then keep mean and std columns only
    train <- read.table("train/X_train.txt")
    test <- read.table("test/X_test.txt")
    features <- read.table("features.txt")
    names(test) <- names(train) <- features[, "V2"]
    train_sub <- subset_df(train)
    test_sub <- subset_df(test)

    ## Get the vectors of activities for the train and test samples
    train_activities <- transform_activities("train/y_train.txt")
    test_activities <- transform_activities("test/y_test.txt")
    
    ## cbind volunteers, activities, and measurements data frames
    train_bind <- cbind(people_train, train_activities)
    test_bind <- cbind(people_test, test_activities)
    names(train_bind) <- names(test_bind) <- c("volunteer", "activity")
    
    train_sub <- cbind(train_bind, train_sub)
    test_sub <- cbind(test_bind, test_sub)
    print(head(train_sub))
    print(head(test_sub))
    full_df <- rbind(train_sub, test_sub)
    
    ## Aggregate the data.frame by people and activities and calculate the
    ## averages of the columns
    library(plyr)
    measurements <- get_mean_and_std_vars(features[, "V2"])
    ave_df <- ddply(test_sub, c("volunteer", "activity"),
                    .fun = function(x) colMeans(x[names(full_df) %in% measurements]))
    head(ave_df)
    write.table(ave_df, file = "tidy_data_set.txt", sep = " ")
}