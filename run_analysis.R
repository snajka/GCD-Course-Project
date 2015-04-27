## Download data

localData <- "./UCI HAR Dataset"
if (!file.exists(localData)) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                  destfile = "getdata-projectfiles-UCI HAR Dataset.zip", mode ="wb")
    unzip("getdata-projectfiles-UCI HAR Dataset.zip")
}

## Load packages
library(tidyr)
library(dplyr)
library(readr) # read_table is faster version of read.table
library(reshape2)

## Load the data files into variables
x_test <- read_table("./UCI HAR Dataset/test/X_test.txt", col_names = FALSE)
y_test <- read_table("./UCI HAR Dataset/test/y_test.txt", col_names = FALSE)
subject_test <- read_table("./UCI HAR Dataset/test/subject_test.txt", col_names = FALSE)

x_train <- read_table("./UCI HAR Dataset/train/X_train.txt", col_names = FALSE)
y_train <- read_table("./UCI HAR Dataset/train/y_train.txt", col_names = FALSE)
subject_train <- read_table("./UCI HAR Dataset/train/subject_train.txt", col_names = FALSE)

features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, sep="\n")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, sep="\n")

## Merge the training and the test sets to create one data set. (Requirement 1)
x <- rbind(x_train,x_test)
colnames(x) <- features$V1

subject <- rbind(subject_train,subject_test)
colnames(subject) <- c("subject")

y <- rbind(y_train,y_test)
colnames(y) <- c("activity")

## Extract only the measurements on the mean and standard deviation for each measurement (Requirement 2)
## Extract indexes of mean but not meanFreq
ind_mean <- grep('mean\\(', colnames(x))
colnames(x)[ind_mean]

## Extract indexes of standard deviation (std) values.
ind_std <- grep('std', colnames(x))
colnames(x)[ind_std]

## Concatanate the mean and standard deviation
ind <- c(ind_mean,ind_std)
x2 <- x[,ind]

## Combine x, y, and subject into one data frame ()
df <- cbind(subject,y,x2)

## Use descriptive activity names to name the factor labels in the data set.
df$activity <- factor(df$activity,
                      levels = c(1,2,3,4,5,6),
                      labels = c("WALKING",
                                 "WALKING_UPSTAIRS",
                                 "WALKING_DOWNSTAIRS",
                                 "SITTING",
                                 "STANDING",
                                 "LAYING"))

## Create an independent tidy data set with averages of each activity. (Requirement 5)
dfMelt <- melt(df, id=c("subject","activity"))
df2 <- dcast(dfMelt, subject+activity~variable, mean)

write.table(df2,
            file = "tidydataset.txt",
            sep ="\t",
            row.names = F,
            quote = F)