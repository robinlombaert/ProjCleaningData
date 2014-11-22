#-- Getting & Cleaning Data: Project
#-- Human Activity Recognition using Smartphones
#   Creating tidy data sets for further analysis
#-- Steps:
#   1. Load the data and merge training and test data sets
#   2. Label the data set variables appropriately
#   3. Extract mean and standard deviation of measurements
#   4. Set descriptive names for activities in the data set
#   5. Create second tidy data set with averages for each activity and subject
#   6. Write the tidy data set to the hard disk.

# 1. Loading data and merging training and test data sets
# define URL and filename, and download the data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fn.zip <- "activity_recognition.zip"
download.file(url,destfile=fn.zip)
unzip(fn.zip)

# Load the training and test data sets.
# The data sets both have the same amount of columns (ie variables)
raw_train <- read.table('UCI HAR Dataset/train/X_train.txt')
raw_test <- read.table('UCI HAR Dataset/test/X_test.txt')

# Load the activity labels
acti_train <- read.table('UCI HAR Dataset/train/y_train.txt')
acti_test <- read.table('UCI HAR Dataset/test/y_test.txt')
# Load the subject labels
subj_train <- read.table('UCI HAR Dataset/train/subject_train.txt') 
subj_test <- read.table('UCI HAR Dataset/test/subject_test.txt')

# Merge the raw data with activity and subject labels by columns
raw_train <- cbind(acti_train,subj_train,raw_train) 
raw_test <- cbind(acti_test,subj_test,raw_test)
# Merge test and training sets by rows
raw_data <- rbind(raw_train,raw_test)



# 2. Label data set variables appropriately
# Read the variable names and apply to the data frame
var.names <- as.character(read.table('UCI HAR Dataset/features.txt')$V2)
# Replace some of the odd characters in the variable names
var.names <- gsub('()','',var.names,fixed=TRUE)
var.names <- gsub('-','.',var.names,fixed=TRUE)
# Add names for the two additional activity and subject label columns
var.names <- c('activity','subject',var.names)
colnames(raw_data) <- var.names



# 3. Make subset of the raw data set out the mean and std variables
# Define a function that tests validity of a given variable name
validVariable <- function(x) {
        # return TRUE for a mean, std, meanFreq and activity/subject columns
        grepl("mean()",x) | grepl('std()',x) | grepl('meanFreq()',x) | x %in% c('activity','subject')
}
# Subset the raw_data with the validity test on var.names
raw_selection <- raw_data[validVariable(var.names)]



# 4. Add descriptive activity names to the data set
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt',
                              colClasses=c('integer','character'))
raw_selection$activity <- factor(raw_selection$activity,
                                 levels=activity_labels$V1,
                                 labels=activity_labels$V2)



# 5. Create 2nd tidy data set with the average for each variable per activity and subject
# Make use of aggregate for the function mean() across the activity and subject factors
# There are 79 variables left after the selection procedure in 3.
tidy_data <- aggregate(raw_selection[3:81],
                       by=list(raw_selection$activity,raw_selection$subject),
                       FUN=mean)
colnames(tidy_data)[1:2] <- c('activity','subject')



# 6. Write the table to the hard disk
write.table(tidy_data,'activity_recognition_tidy.txt',row.names=FALSE)






