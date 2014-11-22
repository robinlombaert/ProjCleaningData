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

The **CodeBook** provides the explanation of the variables in the data set and the 
transformations done to the original format of the raw data. Additional information
is available in the information accompanying the raw data, available at the download
link. 

The produced table is a tidy data set. It follows the principles of what makes a 
data set tidy: 
- One variable per column (including activity and subject)
- One measurement per row (averaged for each activity and subject)
In this solution, a wide data set is produced. I had a preference for this form because 
it is closer to the form of the raw data, as opposed to a narrow form.

If you want to read the data set into R, you can do:  
test <- read.table('activity_recognition_tidy.txt',header=TRUE)

