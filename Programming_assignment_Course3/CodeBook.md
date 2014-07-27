The variable names of the final tidy_data_set.txt are the same of the original
data set, as described in the file features.txt

volunteer -- a number [1, 30] corresponding to the person who acquired data
activity -- the activity (WALKING, STANDING, etc.) done for each measurement
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

mean(): Mean value
std(): Standard deviation

Each row in the data set is the average per person per activity of the
corresponding measurement.

The transformations to obtain the tidy data set, starting from the initial
training and testing data sets are:
1. Add volunteer and activity columns to the left of the train and test data frames;
2. Assign the column names to the train and test data frames;
3. Subset train and test data frames into the relevant variables (means and std's);
4. Merge by row the train and test data frames;
5. Calculate the average for each variable in the merged data frame, aggregating
by volunteer and activity.