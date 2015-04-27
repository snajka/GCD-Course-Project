This repository contains the following files for the Getting and Cleaning Data Course Project

README.md (this file)  
Codebook.md  
run_analysis.R  
tidydataset.txt  

The main purpose of this project was to tidy up the data collected from accelerometers from the Samsun Galaxy S smartphone. A full description of the data collected can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original source of the data is found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Files used in this project include:

UCI HAR Dataset/test/X_test.txt  
UCI HAR Dataset/test/y_test.txt  
UCI HAR Dataset/test/subject_test.txt  
UCI HAR Dataset/train/X_train.txt  
UCI HAR Dataset/train/y_train.txt  
UCI HAR Dataset/train/subject_train.txt  
UCI HAR Dataset/features.txt  
UCI HAR Dataset/activity_labels.txt  

How run_analysis.R script works:

1. It merges the training and the test sets to create one data set. (using rbind, cbind)
2. It extracts only the measurements on the mean and standard deviation for each measurement. (using the grep() function)
3. Uses descriptive activity names to name the activities in the data set (these columns are named from the features.txt file)
4. Appropriately labels the data set with descriptive variable names. (these columns are labeled from the activity_labels.txt file)
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. (uses dplyr and tidyr to accomplish this task)
