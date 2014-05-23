# Wearable Computing

## Getting and Cleaning Data Course Project

One of the most exciting areas in all of data science right now is wearable computing.
The data analyzed is collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description of the data is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Content

This repository contains sript that process the abovementioned data, as well as the result of processing.

## Data

Please note that data processed by the run_analysis.R script needs to be downloaded from here
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and uzipped.

The path to the source data folder needs to be be specified in **datasetDir** constant in the script.

## run_analysis.R

The script does the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Tidy data produced by the script as well as the "independent tidy data set"
are written by the script to .txt files called **tidy_data.txt** and **independent_tidy_data.txt** files, correspondingly.