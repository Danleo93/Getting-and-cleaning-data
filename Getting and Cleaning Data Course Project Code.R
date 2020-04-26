newwd<-setwd("C:/Users/danie/Desktop/Coursera/course 3 cleaning data/week4 file peer/files peer" )
features<-read.table("features.txt")
activities<-read.table("activity_labels.txt")  #I read all the files that will be helpfull to assign the right variables name and acitivity informations



train<-read.table("X_train.txt") #the file with train data
y_train<-read.table("y_train.txt") #the file with the activity's code
subject_train<-read.table("subject_train.txt") #the file with the suibject's code
names(train)<-features$V2 #I assign the right name to the variables (I know it's STEP4 but I find easier to do that now for merging files)
train$subject<-subject_train$V1 #I include a new column with the subjects informations to train data frame
train$activity<-y_train$V1 #I include a new column with the activity informations to train data frame



test<-read.table("X_test.txt")#the file with test data
y_test<-read.table("y_test.txt")  #the file with the activity's code
subject_test<-read.table("subject_test.txt") #the file with the suibject's code
names(test)<-features$V2 #I assign the right name to the variables (I know it's STEP4 but I find easier to do that now for merging files)
test$subject<-subject_test$V1 #I include a new column with the subjects informations to test data frame
test$activity<-y_test$V1 #I include a new column with the activity informations to test data frame

mydata<-rbind(train,test) #I merge the two data frames (STEP1)

col_mean_std<-grep(pattern = "mean\\(\\)|std\\(\\)|activity|subject",x=names(mydata)) #I obtain the column index of column named with std, mean, subject or activity
data_mean_std<-mydata[,col_mean_std] #I use this index to extract the right data (STEP2)
data_mean_std$activitylabels<-as.factor(mydata$activity)
levels(data_mean_std$activitylabels)<-as.character(activities$V2) #I assign the right esplicative activity labels to the column that contains the activities code (STEP3)


library(reshape2)
melted_data<-melt(data_mean_std,id=c("subject","activitylabels"),measure.vars = names(data_mean_std[,1:66])) #I melt subject and activity data 
tidydata<-dcast(melted_data,activitylabels+subject~variable,mean) #I obtain my tidy data containing the mean for each subject for each activity
write.table(tidydata,file="tidydata.txt", row.names = F) #I wirte this data in a txt table