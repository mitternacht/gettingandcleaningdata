# Getting and Cleaning Data Course Repository
Repository for Getting and Cleaning Data course offered by John Hopkins University (Coursera) as part of Data Science specialization program.

# Course Project
The goal of the course project is to collect, work with, and clean data collected from the accelerometers from the Samsung Galaxy S smartphone.
The data for the project are available in the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zp
Descriptions of the data files can be found in README.txt file.

# What run_analysis.R script do?
The run_analysis.R script do the following operations:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Renames activities data with their corresponding names.
* Appropriately labels the data set with descriptive variable names. 
* From the data set in previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Exports the independent tidy data set created in previous step to a text file named "avg_tidy_data.txt" located in the main directory of your working directory.

# Instructions
* Download data set via the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Extract UCI HAR Dataset folder in the main directory of your working directory.
* Install R packages "plyr" and "data.table" if they are not installed.
* Execute "run_analysis.R" script.