# The unzipped data needs to be in the working directory in order for this code to run. 
#Read the relevant data for the test group and merge them together
data_test<-read.table("X_test.txt")
label_test<-read.table("y_test.txt")
subject_test<-read.table("subject_test.txt")
test<-cbind(subject_test, label_test, data_test)
#Create a new column to indicate that all of the data above correspond to the test group
test$type<-"test"
#Read the relevant data for the training group and merge them together
data_train<-read.table("X_train.txt")
label_train<-read.table("y_train.txt")
subject_train<-read.table("subject_train.txt")
train<-cbind(subject_train, label_train, data_train)
#Create a new column to indicate that all of the data above correspond to the training group
train$type<-"train"
#Merge data from both groups (test and training) to obtain one big dataframe
merged_data<-rbind(test, train)
#In order to place the appropriate labels into the newly created big dataframe, we need to retrieve them from the features.txt file
features<-read.table("features.txt")
features<-features[, 2]
# A few operations are necessary in order to get rid of unnecessary spaces and characters, as well as to place new characters (_) that will make the labels more readable 
library(stringr)
features_2<-gsub("-", " ", features,)
features_3<-gsub("\\(\\)", "", features_2,)
features_4<-str_trim(features_3, side="right")
features_final<- gsub('([[:punct:]])|\\s+','_',features_4)
features_to_correct<-features_final[555:561]
features_final[555:561]<-substr(features_to_correct, 1, nchar(features_to_correct)-1)
# Now that the labels for all the variables are ready, we can concatenate them with the labels for the rest of the columns and pass it to the column names
colnames(merged_data)<-c("subject", "activity", features_final, "type")
# Another step that needs to be taken in the analysis is to replace the activity numbers (from 1 to 6) with the corresponding activities to make the dataset more readable
merged_data$training_labels[merged_data$training_labels==1]<-"Walking"
merged_data$training_labels[merged_data$training_labels==2]<-"Walking upstairs"
merged_data$training_labels[merged_data$training_labels==3]<-"Walking downstairs"
merged_data$training_labels[merged_data$training_labels==4]<-"Sitting"
merged_data$training_labels[merged_data$training_labels==5]<-"Standing"
merged_data$training_labels[merged_data$training_labels==6]<-"Laying"
#The following part of the code is used to extract only the measurements on the mean and standard deviation for each measurement in order to obtain a new dataframe
merged_data_mean<-merged_data[,grepl("mean", colnames(merged_data))]
merged_data_std<-merged_data[,grepl("std", colnames(merged_data))]
merged_mean_and_std<-cbind(merged_data[, 1:2], merged_data_mean, merged_data_std)
#This last part of the code creates the second tidy dataset with the average of each variable for each activity and each subject and saves it as a text file
library(plyr)
merged_data_averaged<-ddply(merged_data, .(training_labels, subject), numcolwise(mean))
write.table(merged_data_averaged, "second_independent_tidy_dataset.txt", row.names=F)

