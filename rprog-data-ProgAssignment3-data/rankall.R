rankall <- function(outcome, num="best") {
    ## Read outcome data
    df <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    names(df)[11] <- c("heart attack")
    names(df)[17] <- c("heart failure")
    names(df)[23] <- c("pneumonia")
    
    df[, 11] <- as.numeric(df[, 11])
    df[, 17] <- as.numeric(df[, 17])
    df[, 23] <- as.numeric(df[, 23])
    
    ## Check that state and outcome are valid
    possible_outcomes <- c("heart attack", "heart failure", "pneumonia")
    if (!(outcome %in% possible_outcomes)) {
        stop("invalid outcome")
    }

    
    get_state <- function(df, outcome, num) {
        state_df <- subset(df, !is.na(df[[outcome]]), select=c("Hospital.Name",
                                                               "State", outcome))
        state_df <- state_df[order(state_df[outcome],
                                   state_df["Hospital.Name"]),
                             c("Hospital.Name", "State")]
        names(state_df) <- c("hospital", "state")
        if (num=="best") num <- c(1)
        if (num=="worst") num <- c(nrow(state_df))
        state_df[num, ]
    }

    l <- split(df, df$State)
    final_list <- lapply(l, get_state, outcome, num)
    data.frame(t(sapply(final_list, cbind)))
}