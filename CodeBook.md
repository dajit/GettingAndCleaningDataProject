Overview:
=========

This code book describes the processing of Human Activity Recognition data collected using smartphones. The data for this project represents data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The feature data is collected for 30 subjects for below 6 activities:

	WALKING
	WALKING_UPSTAIRS
	WALKING_DOWNSTAIRS
	SITTING
	STANDING
	LAYING

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
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
	
The complete list of variables of each feature vector is available in 'features.txt'
	
Input Data:
===========
Below data files are processed to achieve the objective

	- 'features_info.txt': Shows information about the variables used on the feature vector.

	- 'features.txt': List of all features.

	- 'activity_labels.txt': Links the class labels with their activity name.

	- 'train/X_train.txt': Training set.

	- 'train/y_train.txt': Training labels.

	- 'test/X_test.txt': Test set.

	- 'test/y_test.txt': Test labels.


Objective:
==========
Using the input data sets listed above, the run_analysis.R script performs below tasks:
	Merges the training and the test sets to create one data set.
	Extracts only the measurements on the mean and standard deviation for each measurement.
	Uses descriptive activity names to name the activities in the data set
	Appropriately labels the data set with descriptive variable names.
	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Output:
=======
  Output data set contains below :
	"subject" : (subject 1 through subject 30)
	"activity" : ( WALKING,	WALKING_UPSTAIRS,	WALKING_DOWNSTAIRS,	SITTING	STANDING,	LAYING)
  Mean and standard deviation meausres listed below:
	"timeBodyAccelerometer-mean()-X","timeBodyAccelerometer-mean()-Y","timeBodyAccelerometer-mean()-Z","timeBodyAccelerometer-std()-X"
	,"timeBodyAccelerometer-std()-Y","timeBodyAccelerometer-std()-Z","timeGravityAccelerometer-mean()-X","timeGravityAccelerometer-mean()-Y"
	,"timeGravityAccelerometer-mean()-Z","timeGravityAccelerometer-std()-X","timeGravityAccelerometer-std()-Y","timeGravityAccelerometer-std()-Z"
	,"timeBodyAccelerometerJerk-mean()-X","timeBodyAccelerometerJerk-mean()-Y","timeBodyAccelerometerJerk-mean()-Z","timeBodyAccelerometerJerk-std()-X"
	,"timeBodyAccelerometerJerk-std()-Y","timeBodyAccelerometerJerk-std()-Z","timeBodyGyroscope-mean()-X","timeBodyGyroscope-mean()-Y"
	,"timeBodyGyroscope-mean()-Z","timeBodyGyroscope-std()-X","timeBodyGyroscope-std()-Y","timeBodyGyroscope-std()-Z","timeBodyGyroscopeJerk-mean()-X"
	,"timeBodyGyroscopeJerk-mean()-Y","timeBodyGyroscopeJerk-mean()-Z","timeBodyGyroscopeJerk-std()-X","timeBodyGyroscopeJerk-std()-Y"
	,"timeBodyGyroscopeJerk-std()-Z","timeBodyAccelerometerMagnitude-mean()","timeBodyAccelerometerMagnitude-std()","timeGravityAccelerometerMagnitude-mean()"
	,"timeGravityAccelerometerMagnitude-std()","timeBodyAccelerometerJerkMagnitude-mean()","timeBodyAccelerometerJerkMagnitude-std()"
	,"timeBodyGyroscopeMagnitude-mean()","timeBodyGyroscopeMagnitude-std()","timeBodyGyroscopeJerkMagnitude-mean()","timeBodyGyroscopeJerkMagnitude-std()"
	,"frequencyBodyAccelerometer-mean()-X","frequencyBodyAccelerometer-mean()-Y","frequencyBodyAccelerometer-mean()-Z","frequencyBodyAccelerometer-std()-X"
	,"frequencyBodyAccelerometer-std()-Y","frequencyBodyAccelerometer-std()-Z","frequencyBodyAccelerometerJerk-mean()-X","frequencyBodyAccelerometerJerk-mean()-Y"
	,"frequencyBodyAccelerometerJerk-mean()-Z","frequencyBodyAccelerometerJerk-std()-X","frequencyBodyAccelerometerJerk-std()-Y"
	,"frequencyBodyAccelerometerJerk-std()-Z","frequencyBodyGyroscope-mean()-X","frequencyBodyGyroscope-mean()-Y","frequencyBodyGyroscope-mean()-Z"
	,"frequencyBodyGyroscope-std()-X","frequencyBodyGyroscope-std()-Y","frequencyBodyGyroscope-std()-Z","frequencyBodyAccelerometerMagnitude-mean()"
	,"frequencyBodyAccelerometerMagnitude-std()","frequencyBodyBodyAccelerometerJerkMagnitude-mean()","frequencyBodyBodyAccelerometerJerkMagnitude-std()"
	,"frequencyBodyBodyGyroscopeMagnitude-mean()","frequencyBodyBodyGyroscopeMagnitude-std()","frequencyBodyBodyGyroscopeJerkMagnitude-mean()"
	,"frequencyBodyBodyGyroscopeJerkMagnitude-std()"

Processing:
===========
The script run_analysis.R carries out below steps process the input and transform it into the required output tidydataset.txt

	Step 0

	Create new working directory if it does not exist. Download zip file and set directory locations for input files

	Step 1

	Load reference data about acitivity lables

	Step 2

	Load test activity data. Assign activity label to test data

	Step 3

	Load training activity data. Assign activity label to training data

	Step 4

	Load training data. Load the feature labels. Assign feature lables to the training data frame. Load training subject data. Add new column "subject" to training data set. Add new column "activity" to above train data set.

	Step 5

	Load test data. Load the feature labels. Assign feature lables to the test data frame. Load test subject data. Add new column "subject" to test data set. Add new column "activity" to test data set.

	Step 6

	Merge training and test data set

	Step 7

	Extract only mean and std for each measure so extarct these measure names and also subject as we need it later. Now extract only select columns/measures from the consolidated final dataset.

	Step 8

	Assign descriptive names to filtered data set created in step above

	Step 8

	Fnally create final data set using the filteredDataset, split it by 'subject,activity', use this split SubData i.e. .SD, apply the mean function

	Step 10

	Write the dataset in tidydataset.txt
    