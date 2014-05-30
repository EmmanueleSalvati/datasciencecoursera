rankhospital <- function(state, outcome, num="best") {
    ## Read outcome data
    df <- read.csv("outcome-of-care-measures.csv", colClasses="character")
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
    
    accepted_outcomes <- c("heart attack", "heart failure", "pneumonia")
    if (!(outcome %in% accepted_outcomes)) {
        stop("invalid outcome")
    }

    ## Slice dataframe by state and outcome
    get_by_state <- function(dataframe, state, outcome) {
        df <- subset(dataframe, State==state, select=c("State", outcome))
    }
    
        
    state_df <- get_by_state(df, state, outcome)

    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    
    
    ## Now rank the column outcome
    rank_vector <- rank(state_df[, outcome], na.last=NA)

    #     print(state_df[, outcome])
    print("And the rank is")
    print(rank_vector)
}