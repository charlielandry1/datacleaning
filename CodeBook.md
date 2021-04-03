Author: Charlie Landry
Date: 3 April 2021

This CodeBook describes the variables found in file "assignment.txt".

This CodeBook builds on two files included as part of the original data set for this project, which can be found at this URL:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

These two files from the original data are:
- features_info.txt
- README.txt

"features_info.txt" is pasted below in its entirety. "README.txt" has been included as part of "README.md", which can be found in the same GitHub repository as this file.

========================================================================

Variables in "assignment.txt"
========================================================================

- "subject" - the individual who performed the activity; its range is 1 through 30

- "activity" - the activity performed by the individual during the measurement of each data point; there are 6 different activities

- "feature" - the measurements for the original data set come from accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. For a description of all features measured as part of the original data set, as well as the various estimated variables for each signal measured, please see the original "Feature Selection" section below. For this data set, only the estimations of mean value ("mean()") and standard deviation ("std()") were kept from the original data. Hence, each variable in "feature" contains either "mean()" or "std()"

- "average" - this is the average value of all observations of a particular value for a particular subject performing a particular activity. So, for example, the first [1] row in the data set "assignment.txt" shows the average of all observations of "fBodyAcc-mean()-X" performed by subject "1" performing activity "LAYING" across all data from the original UCI data set.

========================================================================


The original "features_info.txt" file from the Human Activity Recognition Using Smartphones Data Set is below.
========================================================================


Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'