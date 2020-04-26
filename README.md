# Getting-and-cleaning-data
Getting and cleaning data course week 4 peer assignment

The data included in this analysis are downloadable from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The file needed to carrying out the analisys from the attached link are the following:
-features.txt :List of all features
-activity_labels.txt :Links the class labels with their activity name.

from test folder
-X_test.txt :Test set.
-y_test.txt :Test Labels
-subject_test.txt :subject for each measurement from the test set

from train folder
-X_train.txt :Training set.       
-y_train.txt :Training labels.
-subject_train.txt :subject for each measurement from the train set


#How to carry the analisys.
Use the script reported in this repo file: Getting and Cleaning Data Course Project Code.R.
You should insert in the argument of setwd(" ")the path of the directory in which you inserted the downloaded files.

The script read all the previously described files (that are supposed to be in the directory that you inserted as argument of setwd()).
The script add columns with the appropriate subject and activity informations in both test and train dataframes.
The script assign the right variables names to the train and test dataframes from the ones reported in the second column of the Features.txt file.

The script merge the test and train dataframes using rbind().
The script filter only the column names that finish with mean(),std(), subject and activity, using grep() function.
The script extract those columns from the merged data frames and assign it to a new object called data_mean_std.
The script create a new column with the labels of the activities.
The script open reshape2 pack that will be usefull to create the final tidy data.
The script melt the dataframes according the subject and activity column using the melt function.
The script create the tidy data in which are summarised the mean value for each variable, for each subject, for each activity using dcast().
The script write the tidy data in a new txt file using write.table().


