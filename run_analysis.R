## this will download the .zip file to your current working directory, so 
## please be sure to set your WD before starting

## install and load the packages you will use
library(dplyr)
library(tidyr)

## download the .zip file and extract it
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile = "assignment.zip")
unzip("assignment.zip")
setwd("./UCI HAR Dataset")

## read the different files you'll use as data frames
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
subject_test <- read.table("./test/subject_test.txt")
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_train <- read.table("./train/subject_train.txt")
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")

## rename variables across DFs to be more descriptive and to match across DFs
colnames(activity_labels) <- c("activity","activity_name")
colnames(subject_test) <- "subject"
colnames(y_test) <- "activity"
colnames(subject_train) <- "subject"
colnames(y_train) <- "activity"

## use a join to match the activity for test & train  with the appropriate labels
y_test <- y_test %>% left_join(activity_labels)
y_train <- y_train %>% left_join(activity_labels)

## use the features table to add names to the variables across train & test sets
featnames <- features[,2]
colnames(X_test) <- featnames
colnames(X_train) <- featnames

## combine all test sets to show subject, activity, and variable measurements
combinedtest <- cbind(subject_test,y_test[,2],X_test)

## combine all train sets to show subject, activity, and variable measurements
combinedtrain <- cbind(subject_train,y_train[,2],X_train)

## rename activity variable to a descriptive name
names <- colnames(combinedtest)
names[2] <- "activity"
colnames(combinedtest) <- names

names <- colnames(combinedtrain)
names[2] <- "activity"
colnames(combinedtrain) <- names

## combine test and train sets into a single data set
all_merged <- rbind(combinedtest,combinedtrain)

## select only those measurements that are standard deviation or mean, plus 
## those columns showing subject and activity
find <- "mean\\(|std\\("
std_mean <- grep(find,colnames(all_merged), value = TRUE)
first_two <- colnames(all_merged[1:2])
selected_columns <- c(first_two, std_mean)
selected_measurements <- all_merged %>% select(all_of(selected_columns))

## tidy the data
tidy_measure <- selected_measurements %>% 
  pivot_longer(cols = !subject:activity, names_to = "feature", values_to = "value")

## create a second data set showing the average of each variable for each activity
## and each subject
avg_measure <- tidy_measure %>% group_by(subject, activity, feature) %>%
  summarize(average = mean(value))

## and if you want to write the table, you can use this:
## write.table(avg_measure, file = "assignment.txt")
## to read it back, you can use this:
## assignment <- read.table("assignment.txt", header = TRUE)
