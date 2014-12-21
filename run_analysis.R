
library(plyr);
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#Download the file
download.file(fileUrl,destfile="project_data1.zip",method="curl")

#Unzip the file and setting the working diectory
unzip(zipfile="project_data1.zip")
setwd("./UCI HAR Dataset")

#Read the activity files into the variables
datasetactivitytest<-read.table("./test/Y_test.txt",header=FALSE)
datasetactivitytrain<-read.table("./train/Y_train.txt",header=FALSE)
#Read the subject files into the variables
datasetsubjecttrain<-read.table("./train/subject_train.txt",header=FALSE)
datasetsubjecttest<-read.table("./test/subject_test.txt",header=FALSE)
#Read the features files into the variables
datasetfeaturestest<-read.table("./test/X_test.txt",header=FALSE)
datasetfeaturestrain<-read.table("./train/X_train.txt",header=FALSE)

#Check the variables
str(datasetactivitytest)
str(datasetactivitytrain)
str(datasetsubjecttrain)
str(datasetsubjecttest)
str(datasetfeaturestest)
str(datasetfeaturestrain)



#merge the file for each category in the test and train folder
datasetactivity<-rbind(datasetactivitytrain,datasetactivitytest)
datasetsubject<-rbind(datasetsubjecttrain,datasetsubjecttest)
datasetfeatures<-rbind(datasetfeaturestrain,datasetfeaturestest)
#set names to variables
names(datasetactivity)<-c("activity")
names(datasetsubject)<-c("subject")
datafeaturesnames<-read.table("features.txt",header=FALSE)
names(datasetfeatures)<-datafeaturesnames$V2
#merge the train and the test sets to create one dataset
datacolcombine<-cbind(datasetsubject,datasetactivity)
dataset<-cbind(datasetfeatures,datacolcombine)


#Extracts only the measurements on the mean and standard deviation for each measurement
#pick the name have the mean and std
subdatafeaturesnames<-datafeaturesnames$V2[grep("mean\\(\\)|std\\(\\)", datafeaturesnames$V2)]
#give the names with data to the dataset 
selectednames<-c(as.character(subdatafeaturesnames),"subject","activity")
dataset<-subset(dataset,select=selectednames)

#Uses descriptive activity names to name the activities in the dataset
#Read the activitylabel names
activitylabels<-read.table("activity_labels.txt", header=FALSE)

#set the name activity and activitys for each colname
colnames(activitylabels)  <- c('activity','activitys')
#merge the two data set by the same name "activity"
dataset<-merge(dataset,activitylabels)
#check
head(dataset$activity,30)



#Appropriately labels the data set with descriptive variable	names
names(dataset)<-gsub("^t", "time", names(dataset))
names(dataset)<-gsub("^f", "frequency", names(dataset))
names(dataset)<-gsub("Acc", "Accelerometer", names(dataset))
names(dataset)<-gsub("Gyro", "Gyroscope", names(dataset))
names(dataset)<-gsub("Mag", "Magnitude", names(dataset))
names(dataset)<-gsub("BodyBody", "Body", names(dataset))


#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
dataset <-aggregate(. ~subject + activitys, dataset, mean)
dataset <-dataset[order(dataset$subject,dataset$activitys),]
#Write this tidy dataset
write.table(dataset, file = "tidydata.txt",row.name=FALSE)




