

## RUN_ANALISYS.R DESCRIPTION


#### This script is built to generate the "tidyData.txt" text file.

#### tidyData.txt is grouped by "persons" and "activities", showing the Calculated Means in all of its columns.

 
### The script works as follows:

### Setting environment

#### Below the working directory, it contains the data to be loaded by the script and will contain the resulting file
#### tidyData.txt: "/home/abelmontesdeoca/quiz01/UCI HAR Dataset".

### Loads this library to be used for execution of dcast() function at the end of the script. 
#### library(reshape2)

### Loading common tables features.txt
#### This table contains 561 column names to name the variables of X_test.txt and X_train.txt files. 

### The script loads two type of files: "test" and "train". Those files are the foundation of this process.

### Loading test tables (test dataframe)
#### test/X_test.txt, contains the values
#### test/y_test.txt, contains the activities done by persons.
#### test/subject_test.txt, contains the persons who did the activities.

### Assigning column names to test dataframes

#### test/X.test.txt takes its variable names from features.txt
#### test/y_test.txt is assigned the variable name "activity" 
#### test/subject_test is assigned the variable name "subjectlabels"

### Loading train tables (train dataframe)
#### train/X_train.txt, contains the values
#### train/y_train.txt, contains the activities done by persons.
#### train/subject_train.txt, contains the persons who did the activities.

### Assigning column names to train dataframes

#### train/X.train.txt takes its variable names from features.txt
#### train/y_train.txt is assigned the variable name "activity" 
#### train/subject_train is assigned the variable name "subjectlabels

### Adding y_test labels to test dataframe
#### In other words adding the activity codes as a new column.

### Adding subject_test to test dataframe
#### Adding the persons as a new column.

### Adding labels y_train to train dataframe
#### Adding the activity codes as a new column.

### Adding subject train labels to train dataframe
#### Adding the persons as a new column.

### Preparing variable vars to be used for filtering means and stds columns
#### Only variables with a string character containing "mean" and "std" are required.

### Filtering test dataframe
#### Getting the columns with "mean" and "std".

### Filtering train dataframe
#### Getting the columns with "mean" and "std".

### Merging test and train dataframes to get one dataframe.

### Converts the labels column from integer to factor
#### Replacing the activity codes by:
#### "Walking","Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"

### Creates the tidy data set
#### Grouping by Persons/Activities and calculating the Mean for all columns.

### write the tidy data set to tidyData.txt file

## End of the process.

