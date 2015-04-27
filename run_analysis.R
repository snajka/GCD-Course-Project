##*****************************************************************##
## Download data from internet if it is not on your computer ##
##*****************************************************************##

localData <- "./UCI HAR Dataset"
if (!file.exists(localData)) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                  destfile = "getdata-projectfiles-UCI HAR Dataset.zip", mode ="wb")
    unzip("getdata-projectfiles-UCI HAR Dataset.zip")
}

##*****************************************************************##
## Clean data ##
##*****************************************************************##


##*****************************************************************##
## Draw plot in png file ##
##*****************************************************************##

