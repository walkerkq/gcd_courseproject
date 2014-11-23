gcd_courseproject
=================

Course project for Getting and Cleaning Data
Raw data description:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

=====================================


##TIDY DATA SCRIPT
Summary: this script combines the test data and training data with their subject identifiers and activity labels. It reserves only mean and standard deviation variables from the original 561-feature vector of time and frequency variables. The script then melts the data into a tall data frame where all time and frequency variables share a column. From there, the data is recast into a data frame containing the mean of each variable across each subject-activity combination.

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

## 3. Use descriptive activity names to name the activities in the data set.

Change activity numbers into factors

Change factor levels into descriptive labels, using the activity file

## 4. Appropriately label the data set with descriptive variable names.

Use filtered feature index to subset variable names from the features document

Rename data frame variables with features names

## 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

Get a list current data frame (testtrain) variable names, remove subject and activity

Use this list to melt all those variables into one measure column (testtrainMelt)

Recast the data into the mean for each variable per subject-activity combination (testtrainMeans)

## Output a tidy data text file - tidyData.txt
