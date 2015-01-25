This file describes steps involved in creating a tidy dataset from the raw data provided.

Raw data:
The data can be downloaded from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following files were used to create the tidy dataset.


 -'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'features.txt': List of all features.


Script:

The script run_analysis.R will create a tidy dataset using the raw data above.
The script was run on R version 3.1.2

Before running the script, the UCI HAR Dataset must be extracted and available in a directory called “UCI HAR Dataset”

The following steps were involved in arriving at the final tidy dataset:

Load the training datasets : subject_train, x_train and y_train

Examine their dimensions. All 3 training datasets have 7352 observations. The x_train dataset has 561 variables and the y_train and subject_train datasets have 1 variable each.

Load the test datasets : subject_test, x_test and y_test

Examine their dimensions. All 3 test datasets have 2947 observations. The x_test dataset has 561 variables and the y_test and subject_test datasets have 1 variable each.

Combine the 3 training datasets using cbind as they all have same number of observations to create new dataset called “train” with 7352 observations and 563 variables.

Combine the 3 test datasets using cbind as they all have same number of observations to create a  new dataset called “test” with 2947 observations and 563 variables.

Combine the “train” and “test” datasets using rbind to create a new dataset called “all” with 10299 observations and 563 variables.

Load the features.txt file and examine its dimensions. It has 561 observations and 2 variables.

Create a vector “v” using the 2nd variable of features to get descriptive variable names for data.

Use grep to modify the variables in “v” to comply with R variable naming standards by replacing illegal characters “-”, “(“ and “)” with “.” 

Then extract only those variables from the original dataset with measurements on the mean and standard deviation that is containing “.mean.” or ”.std.” in the variable name. Variables containing  “meanFreq” in the name were not included as these are not measurements on the mean.

Use variable names “subject” and “activity” and vector of names extracted using grep to appropriately label the dataset with descriptive label names.

Load the activity_labels.txt file as “activity_names” and examine its contents. 

Create variable names “activity” and “activity_name” for the 2 variables in activity_names

To use decsriptive activity names to name activities in the dataset, create a new dataset “all2” by merging all1 with activity_names.

Create dataset “all3” by dropping variable ”activity” to avoid having 2 columns with same variable.

Install package “dplyr”. Load library(dplyr) and use group_by to group “all3” by subject and activity.

Use summarise_each with funs(mean) to create a tidy dataset with the average of each variable for each activity and each subject.


