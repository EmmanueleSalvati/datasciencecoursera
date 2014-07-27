In order to create the tidy data set, you need to
1. Source the .R file
    source('./run_analysis.R')
2. Call the run_analysis function
    run_analysis()

The script assumes that the current working directory is the directory created
when you unzip the file downloaded from the Programming Assignment page.

The transformations to obtain the tidy data set, starting from the initial
training and testing data sets are:
1. Add volunteer and activity columns to the left of the train and test data frames;
2. Assign the column names to the train and test data frames;
3. Subset train and test data frames into the relevant variables (means and std's);
4. Merge by row the train and test data frames;
5. Calculate the average for each variable in the merged data frame, aggregating
by volunteer and activity.
