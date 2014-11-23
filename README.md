gcd_courseproject
=================

Course project for Getting and Cleaning Data


## Set up raw data files
Load in the raw data file (UCIHARDataset.zip) using curl
Unzip the raw data
Create a table for each relevant txt file (X_test, y_test, X_train, y_train, subject_train, subject_test, features, and activities)

## 1. Merge the training and the test sets to create one data set.
Column bind the three test files
Rename the subject and activity columns to differentiate them
Column bind the three train files
Rename the subject and activity columns to differentiate them
Row bind the test data on top of the train data (testtrain)

## 2. Extract only the measurements on the mean and standard deviation for each measurement. 
Turn features from factors into characters (these will become the descriptive column names)
Filter out any features that do not include "mean" or "std"
Add filtered feature index to a list that includes row numbers for activity and subject
Use filtered feature list, sorted into numerical order, to subset the data frame to only include columns with  mean or std, plus subject and activity

## 3. Uses descriptive activity names to name the activities in the data set
Change activity numbers into factors
Change factor levels into descriptive labels, using the activity file

## 4. Appropriately labels the data set with descriptive variable names.
Use filtered feature index to subset variable names from the features document
Rename data frame variables with features names

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Get a list current data frame (testtrain) variable names, remove subject and activity
Use this list to melt all those variables into one measure column (testtrainMelt)
Recast the data into the mean for each variable per subject-activity combination (testtrainMeans)

## Output a tidy data text file - tidyData.txt
