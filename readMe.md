---
title: "readMe"
author: "Elodie Camprasse"
date: "Sunday, July 20, 2014"
output: html_document
---

Human Activity Recognition Using Smartphones Dataset
Source: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

Context: "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its 
embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments 
have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was 
selected for generating the training data and 30% the test data."  

The data needs to be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Then it needs to be unzipped and placed in the working directory in order to run the script provided. 

The code supplied is used to manipulate the original data files corresponding for the test and the training groups. 
In particular, here is what the code does in chronological order:
- merges the training and the test sets to create one data set
- appropriately labels the data set with descriptive variable names
- uses descriptive activity names to name the activities in the data set
- extracts only the measurements on the mean and standard deviation for each measurement
- creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
