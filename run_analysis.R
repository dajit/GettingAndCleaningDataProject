# Load required library
library(data.table)

# Step 0
# Create new working directory if it does not exist
if ( !file.exists("project-data" ) )
{ 
  dir.create("project-data") 
} 

setwd("project-data")

# download zip file
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipName <- file.path(getwd(), "input_data.zip")
download.file(url, zipName)
unzip(zipName, overwrite = TRUE) 

# set data directory locations
datasetDir <- paste( getwd() , "\\UCI HAR Dataset", sep="")
#print(datasetDir)

trainDataDir <- paste(datasetDir , "\\train", sep="")
#print(trainDataDir)

testDataDir <- paste(datasetDir , "\\test", sep="")
#print(testDataDir)

# Step 1
# load reference data about acitivity lables
fileName <- paste(datasetDir, "\\", "activity_labels.txt" , sep ="")
#print(fileName)
activityLables <- fread(fileName, sep = " ")

# Step 2 
# Load test activity data
fileName <- paste(testDataDir, "\\", "y_test.txt" , sep ="")
#print(fileName)
testActivity <- fread(fileName)

# assign activity label to test data
testActivity$activityLabel[testActivity$V1 == "1"] <- 
  activityLables[activityLables$V1 == "1"]$V2 ;
testActivity$activityLabel[testActivity$V1 == "2"] <- 
  activityLables[activityLables$V1 == "2"]$V2 ;
testActivity$activityLabel[testActivity$V1 == "3"] <- 
  activityLables[activityLables$V1 == "3"]$V2 ;
testActivity$activityLabel[testActivity$V1 == "4"] <- 
  activityLables[activityLables$V1 == "4"]$V2 ;
testActivity$activityLabel[testActivity$V1 == "5"] <- 
  activityLables[activityLables$V1 == "5"]$V2 ;
testActivity$activityLabel[testActivity$V1 == "6"] <- 
  activityLables[activityLables$V1 == "6"]$V2 ;

# Step 3
# Load training activity data
fileName <- paste(trainDataDir, "\\", "y_train.txt" , sep ="")
#print(fileName)
trainActivity <- fread(fileName)

# assign activity label to training data
trainActivity$activityLabel[trainActivity$V1 == "1"] <- 
  activityLables[activityLables$V1 == "1"]$V2 ;
trainActivity$activityLabel[trainActivity$V1 == "2"] <- 
  activityLables[activityLables$V1 == "2"]$V2 ;
trainActivity$activityLabel[trainActivity$V1 == "3"] <- 
  activityLables[activityLables$V1 == "3"]$V2 ;
trainActivity$activityLabel[trainActivity$V1 == "4"] <- 
  activityLables[activityLables$V1 == "4"]$V2 ;
trainActivity$activityLabel[trainActivity$V1 == "5"] <- 
  activityLables[activityLables$V1 == "5"]$V2 ;
trainActivity$activityLabel[trainActivity$V1 == "6"] <- 
  activityLables[activityLables$V1 == "6"]$V2 ;


# Step 4 
# Load training data 
fileName <- paste(trainDataDir, "\\", "x_train.txt" , sep ="")
#print(fileName)
trainFeatureMeasures <- fread(fileName, sep = " ")

#> str(trainFeatureMeasures)
#Classes 'data.table' and 'data.frame':	7352 obs. of  561 variables

# Load the feature labels
fileName <- paste(datasetDir, "\\", "features.txt" , sep ="")
#print(fileName)
featureLabels <- fread(fileName, sep = " ")

# Note the V2 contains actual lable for the features in below data frame
#> str(featureLabels)
#Classes 'data.table' and 'data.frame':	561 obs. of  2 variables:
#  $ V1: int  1 2 3 4 5 6 7 8 9 10 ...
#$ V2: chr  "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" 

# assign feature lables to the training data frame
names(trainFeatureMeasures) <- featureLabels$V2

# load training subject data
fileName <- paste(trainDataDir, "\\", "subject_train.txt" , sep ="")
#print(fileName)
trainSubject <- fread(fileName)

# add new column "subject" to above training data set
trainData <- trainFeatureMeasures
trainData$subject <- trainSubject$V1
#> dim(trainData)
#[1] 7352  562

# add new column "activity" to above training data set
trainData$activity <- trainActivity$activityLabel


# Step 5
# Load test data

fileName <- paste(testDataDir, "\\", "X_test.txt" , sep ="")
#print(fileName)
testFeatureMeasures <- fread(fileName, sep = " ")

#> str(testFeatureMeasures)
#Classes 'data.table' and 'data.frame':	2947 obs. of  561 variables:
  
# assign feature lables to the test data set
names(testFeatureMeasures) <- featureLabels$V2

# load test subject data
fileName <- paste(testDataDir, "\\", "subject_test.txt" , sep ="")
#print(fileName)
testSubject <- fread(fileName)

# add new column "subject" to above test data set
testData <- testFeatureMeasures
testData$subject <- testSubject$V1
#> dim(testData)
#[1] 2947  562

# add new column "activity" to above test data set
testData$activity <- testActivity$activityLabel

# dataframe to identify subject - who performed the activity
# subjectTest <- 

# Step 6
# Merge training and test data set

cfData <- rbind(trainData, testData)

#> dim(cfData)
#[1] 10299   562

# Step 7
# Extract only mean and std for each measure so extarct these measure names
# and also subject as we need it later
a <- names(cfData)
dim(a)
selectedColumns <- a[grep( ("mean\\(\\)|std\\(\\)|subject|activity") , a, ignore.case = TRUE)]

# Now extract only select columns/measures from the consolidated final dataset
# select all rows so second argument is TRUE
filteredDataset <- subset(cfData, TRUE, select = c(selectedColumns))

#> dim(filteredDataset)
#[1] 10299    68
#> 


# Step 8
# asign descriptive names
descriptiveNames <- names(filteredDataset)

descriptiveNames <- gsub("^t","time",descriptiveNames)
descriptiveNames <- gsub("^f","frequency",descriptiveNames)
descriptiveNames <- gsub("Acc","Accelerometer",descriptiveNames)
descriptiveNames <- gsub("Gyro","Gyroscope",descriptiveNames)
descriptiveNames <- gsub("Mag","Magnitude",descriptiveNames)
names(filteredDataset) <- descriptiveNames

# Change subject value from '1' to 'Subject 1'
filteredDataset$subject <- paste("Subject", filteredDataset$subject)

# Step 9
# finally create final data set using Sub Data 
# of data table

# Take the filteredDataset, split it by 'subject,activity'
# to this split SubData i.e. .SD , apply the mean function

finalDataset <- filteredDataset[,lapply(.SD, mean), by = 'subject,activity' ]

# Step 10
# now write the dataset in tidydataset.txt
tidyDatasetFile <- paste( getwd() , "\\tidydataset.txt", sep="")
write.csv(finalDataset,file=tidyDatasetFile,row.names =  FALSE)
print(paste("Output tidy data set file name is " , tidyDatasetFile ) )
