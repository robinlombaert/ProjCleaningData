ProjCleaningData
================

## Project repository for the Getting &amp; Cleaning Data course.
Based on data from *Human Activity Recognition Using Smartphones Dataset*. The link is available
[here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).

### Files included in the repo
* README.md
* run_analysis.R -- The code to run the data processing procedure
* CodeBook.md -- Description of the data and how they are processed from the raw data
* activity_recognition_tidy.csv -- The tidy data set associated with this project

### Additional notes
The tidy data set is produced by the **run_analysis script**. It includes the [download link]
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
for the raw data. No additional preparation other than setting the work directory must be done. 

The download link in the script includes all information associated with 
the raw data for further reference. 

The **CodeBook** provides the explanation of the variables in the data set and the 
transformations done to the original format of the raw data. Additional information
is available in the information accompanying the raw data, available at the download
link. 

If you want to read the data set into R, you can do:  
test <- read.table('activity_recognition_tidy.txt',header=TRUE)

