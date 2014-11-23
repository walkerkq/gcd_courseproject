
# download raw data files
file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file.url, "./UCIHARDataset.zip", method="curl")
unzip("./UCIHARDataset.zip")
load in and unzip the files

# create a table for each txt file
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

# 1. Merge the training and the test sets to create one data set.
Xy_test <- cbind(X_test,subject_test,y_test) # column bind test files
colnames(Xy_test)[562:563] <- c("subject","activity") # rename subject and y variables
Xy_train <- cbind(X_train,subject_train,y_train) # column bind train files
colnames(Xy_train)[562:563] <- c("subject","activity") # rename subject and y variables
testtrain <- rbind(Xy_test,Xy_train) # row bind test and train data

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features$V2 <- as.character(features$V2) #turn labels into characters instead of factors
meansandstds <- c(grep("mean", features$V2),grep("std", features$V2)) # filter only measures with mean in the name
meansandstdsz <- c(meansandstds,562,563) # add to list with subj/act numbers
testtrain <- testtrain[ ,sort(meansandstdsz)] # subset data frame to keep only mean and std columns, subj and activity; sort into numerical order

# 3. Uses descriptive activity names to name the activities in the data set
testtrain$activity <- as.factor(testtrain$activity) #change activity numbers into factors
levels(testtrain$activity) <- c(levels(activities$V2)) #change factor values into descriptive labels

# 4. Appropriately labels the data set with descriptive variable names.
collabels <- features[meansandstds,2] # get the names of the variables from the features document, subset them out
colnames(testtrain)[1:79] <- collabels

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
varnames <- names(testtrain) # get a list of variable names
varnames <- varnames[1:79] # keep everything but subject and activity
testtrainMelt <- melt(testtrain,id=c("subject","activity"),measure.vars=varnames) #melt the data into a tall dataset
testtrainMeans <- dcast(testtrainMelt, variable ~ subject + activity, mean) #recast the data into the mean for each variable across subjects and activities

# output a tidy data text file
write.table(testtrainMeans,file="tidyData.txt",row.names=FALSE)

