## Solution to "Getting and Cleaning Data Course Project"
## requires the data-archive 'getdata-projectfiles-UCI HAR Dataset.zip' to be extrated in the working directory

## Read Input-files

subject_test <- read.csv("./test/subject_test.txt",header=FALSE)
X_test <- read.csv("./test/X_test.txt",sep="",header=FALSE)
y_test <- read.csv("./test/y_test.txt",sep="",header=FALSE)

subject_train <- read.csv("./train/subject_train.txt",header=FALSE)
X_train <- read.csv("./train/X_train.txt",sep="",header=FALSE)
y_train <- read.csv("./train/y_train.txt",sep="",header=FALSE)

features <- read.csv("./features.txt",sep="",header=FALSE)

## (1) Merge the training and the test sets to create one data set.
## and: (4) Appropriately labels the data set with descriptive variable names.
X<-rbind(X_test,X_train)
y<-rbind(y_test,y_train)
subject<-rbind(subject_test,subject_train)
names(X)<-features$V2
complete<-cbind(X,y,subject)
names(complete)[562]<-"activity"
names(complete)[563]<-"subject"

## (2) Extracts only the measurements on the mean and standard deviation for each measurement.
i<-grepl("mean", names(complete))|grepl("std", names(complete))
i[562]<-TRUE
i[563]<-TRUE
complete_select <- complete[,i]

## (3) Uses descriptive activity names to name the activities in the data set
complete_select$subject<-as.factor(complete_select$subject)
complete_select$activity<-as.factor(complete_select$activity)
levels(complete_select$activity)<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

## (5) Creates a tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
comp_melt <- melt(complete_select,id=c("subject","activity"))
comp_mean <- dcast(comp_melt,subject+activity~variable,mean)

## Write 'comp_mean.txt' for upload
write.table(comp_mean,file="comp_mean.txt", row.name=FALSE)