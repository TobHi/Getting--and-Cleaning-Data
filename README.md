==================================================================
Solution to "Getting and Cleaning Data Course Project"
==================================================================

The script run_analysis.R expects the input-data to be downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and to be extrated to the working directory.

Required are the sub-folders
/test
/train

and the file
features.txt

==================================================================
The project taskes are given on the project-website as
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The taskes are solved in a slightly different order: we first set 'descriptive variable names' and then use those to select only 'the measurements on the mean and standard deviation'.
==================================================================