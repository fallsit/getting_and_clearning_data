##getting_and_cleaning_data Peer Assessment project CodeBook
=====================

The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. We will be graded by our peers on a series of yes/no questions related to the project. You will be required to submit:

1) a tidy data set as described below,

2) a link to a Github repository with your script for performing the analysis, and

3) a code book that describes the variables, the data, and any transformations or work that we performed to clean up the data called CodeBook.md.

The repo also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

I create one R script called run_analysis.R that does the following. Merges the training and the test sets to create one data set. Extracts only the measurements on the mean and standard deviation for each measurement.

Uses descriptive activity names to name the activities in the data set Appropriately labels the data set with descriptive activity names. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

first, when you extract the file you can see more detailed description of the original dataset, refer to README.txt and features_info.txt. The original data set is divide into train and test which is parted three file for each two folder.
* the measurements 
* the labels for activity
* the subject identifiers

The files that will be used to load data are listed as follows:
* test/subject_test.txt
* test/X_test.txt
* test/y_test.txt
* train/subject_train.txt
* train/X_train.txt
* train/y_train.txt

The tidy data provided the activity label
* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIR
* WALKING_UPSTAIRS


for the folder and file we can know:

1) Values of Varible Activity consist of data from “Y_train.txt” and “Y_test.txt”

2) values of Varible Subject consist of data from “subject_train.txt” and subject_test.txt"

3) Values of Varibles Features consist of data from “X_train.txt” and “X_test.txt”

4) Names of Varibles Features come from “features.txt”

5) levels of Varible Activity come from “activity_labels.txt”

So we will use Activity, Subject and Features as part of descriptive variable names for data in data frame.




