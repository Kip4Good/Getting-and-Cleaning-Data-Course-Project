Getting-and-Cleaning-Data-Course-Project
========================================
Source of Data
========================================
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Unzip file into a local folder to use data. 

run.analysis.R
========================================
The script does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Clean Data
========================================
A cleaned version of the dataset is named combined_clean_data.txt and a similar version with averages is named tidy_data.txt 
