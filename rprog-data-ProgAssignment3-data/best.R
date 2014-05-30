best <- function(state, outcome) {
    ## Read outcome data
    df <- read.csv('outcome-of-care-measures.csv', colClasses="character")
    df[, 11] <- as.numeric(df[, 11])  # heart attack death rate
    df[, 17] <- as.numeric(df[, 17])  # heart failure death rate
    df[, 23] <- as.numeric(df[, 23])  # pneumonia death rate
    
    ## Rename columns for simplicity
    names(df)[11] <- c("heart attack")
    names(df)[17] <- c("heart failure")
    names(df)[23] <- c("pneumonia")
    
    ## Check that state and outcome are valid
    if (!(state %in% df$State)) {
        stop("invalid state")
    }
    
    possible_outcomes <- c("heart attack", "heart failure", "pneumonia")
    if (!(outcome %in% possible_outcomes)) {
        stop("invalid outcome")
    }

    ## Slice the dataframe by state
    get_by_state <- function(dataframe, state="NY") {
        df <- dataframe[dataframe$State==state, ]
        df
    }

    ## Return hospital name in that state with lowest 30-day death
    ## rate
    selected_state <- get_by_state(df, state)
    min_rate_row <- which.min(selected_state[[outcome]])
    Hosp_name <- selected_state$Hospital.Name[min_rate_row]
    print(Hosp_name)
}