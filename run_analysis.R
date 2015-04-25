run_analysis <- function() {
## Author: Abel Montes de Oca
## Country: Dominican Republic
## Contact email: Abel_mdo@hotmail.com
  
## setting environment
setwd("/home/abelmontesdeoca/quiz01/UCI HAR Dataset")
library(reshape2)

## Loading common tables
features <- read.table("features.txt", header = FALSE)

## Getting columns names for data sets
cols <- features$V2 
## Loading test tables
test <- read.table("test/X_test.txt", header = FALSE)
y_test <- read.table("test/y_test.txt", header = FALSE)
subject_test <- read.table("test/subject_test.txt", header = FALSE)
## Assigning column names to test data frames
colnames(test) <- cols
colnames(y_test) <- c("activity")
colnames(subject_test) <- c("subjectlabels")

## Loading train tables
train <- read.table("train/X_train.txt", header = FALSE)
y_train <- read.table("train/y_train.txt", header = FALSE)
subject_train <- read.table("train/subject_train.txt", header = FALSE)
## Assigning column names to train data frames
colnames(train) <- cols
colnames(y_train) <- c("activity")
colnames(subject_train) <- c("subjectlabels")
## Adding y_test labels to test dataframe
test <- cbind(test, y_test)

## Adding subject_test to test dataframe
test <- cbind(test, subject_test)

## Adding labels y_train to train dataframe
train <- cbind(train, y_train)

## Adding subject train labels to train dataframe
train <- cbind(train, subject_train)

## Preparing variable vars to be used for filtering means and stds columns
std_xx <- grep("*std*", cols, value = TRUE)
mean_xx <- grep("*mean*", cols, value = TRUE)
vars <- as.vector(rbind(mean_xx,std_xx), mode = "character")
vars <- unique(vars)
vars <- append(vars, c("activity", "subjectlabels"))
## Filtering test dataframe
test <- subset(test, select = vars)

## Filtering train dataframe
train <- subset(train, select = vars)
## Merging test and train dataframes
test_train_merged <- rbind(test, train)

# convert the labels column from integer to factor
test_train_merged$activity <- factor(test_train_merged$activity, labels=c("Walking",
  "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

# create the tidy data set
melted <- melt(test_train_merged, id=c("subjectlabels","activity"))
tidyData <- dcast(melted, subjectlabels+activity ~ variable, mean)

# write the tidy data set to a file
write.table(tidyData, "tidyData.txt", row.names=FALSE)

}
