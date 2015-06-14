==================================================================
CodeBook to Solution to "Getting and Cleaning Data Course Project"
.. describes the variables, the data, and any transformations or work that you performed to clean up the data ...
==================================================================

The input-data is downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

We used the files

./test/subject_test.txt		provides the subject for each meassure in X-test.txt and y_test.txt
./test/X_test.txt			contains the 561 recorded variables per meassure
./test/y_test.txt			provides the activity for each meassure in X-test.txt and y_test.txt

./train/subject_train.txt	provides the subject for each meassure in X-train.txt and y_train.txt
./train/X_train.txt			contains the 561 recorded variables per meassure
./train/y_train.txt			provides the activity for each meassure in X-train.txt and y_train.txt

./features.txt				provides the variable-names that appear in X_test.txt and X_train.txt

The data recorded in the experiment has been split into the _test and _train datafiles at a 30% to 70% ratio.

==================================================================
To clean up the data we combine all the files given above:
_test and _train data is combined using rbind()
subject, X and y data is combined using cbind()
Then we select only those variables of interest and computed the new clean dataset.
==================================================================