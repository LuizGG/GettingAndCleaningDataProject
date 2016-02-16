# Getting and Cleaning Data Course Project - Codebook

## Original dataset

The original data was divided in train and test dataset. It also had separate files for the subjects ID, activities performed and variable names.
After joining all the files, the final dataset ended with 10,299 observations and 563 variables.

## Study design

According to the original source of the data, the study design is:

*"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."*

Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Process of transforming the data

5 steps (assuming the data is downloaded and read into R) were needed to transform the raw data into a tidy dataset

0. Assuming the data is downloaded and using R version 3.2.3 on windows, the data files are read.
1. Include in the train and test data the subject and activity information, as well as, the variable names. After that, the data is merged.
2. Select only the variables that are measurements of mean or standard deviation.
3. The activities, represented by numbers, are given labels.
4. The variables are renamed to a more cleansed and appropriate name, and the data is now tidy.
5. Using the reshape2 package version 1.41, the data is reshaped to contain the mean for each variable, for each subject and each activity.

Further explanations can be read at the R script.

## Variables at the final dataset

The final dataset (Not reshaped) contains 10,299 observations and 68 variables.
* Subject: Identification of the subject
* Activity: A factor variable with 6 levels (1 - Walking, 2 - WalkingUpStairs, 3 - WalkingDownStairs, 4 - Sitting, 5 - Standing, 6 - Laying)
* The other 66 variables are measuments of mean and standard deviation from diferent types of variables, for further explanation read at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


