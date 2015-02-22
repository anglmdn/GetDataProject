run_analisys<-function(){
  subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
  subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
  x_test<-read.table("./UCI HAR Dataset/test/x_test.txt")
  x_train<-read.table("./UCI HAR Dataset/train/x_train.txt")
  y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
  y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
  names<-read.table("./UCI HAR Dataset/features.txt", sep=" ")
  names$V2<-as.character(names$V2)
  names(subject_train)<-"Subject"
  names(y_train)<-"Activity"
  names(x_train)<-names$V2
  names(subject_test)<-"Subject"
  names(y_test)<-"Activity"
  names(x_test)<-names$V2
  tidy<-rbind(x_test, x_train)
  full1<-cbind(subject_train, y_train)
  full2<-cbind(subject_test, y_test)
  full3<-rbind(full1, full2)
  especific<-tidy[,grepl("-mean|-std", colnames(tidy))]
  complete<-cbind(full3, especific)
  complete$Activity<-as.character(complete$Activity)
  complete$Activity[complete$Activity == "1"]<-"Walking"
  complete$Activity[complete$Activity == "2"]<-"Walking Upstairs"
  complete$Activity[complete$Activity == "3"]<-"Walking Downstairs"
  complete$Activity[complete$Activity == "4"]<-"Sitting"
  complete$Activity[complete$Activity == "5"]<-"Standing"
  complete$Activity[complete$Activity == "6"]<-"Laying"
  
  grouped<-group_by(complete, Subject, Activity)
  final<-summarise_each(grouped, funs(mean))
  namesf<-colnames(final)
  namesf<-gsub("BodyBody", "Body", namesf)
  namesf<-gsub("fBody", "FrecBody", namesf)
  namesf<-gsub("tBody", "TimeBody", namesf)
  namesf<-gsub("-mean()", "Mean", namesf)
  namesf<-gsub("-std()", "Std", namesf)
  namesf<-gsub("-std()", "Std", namesf)
  namesf<-gsub("tGravity", "TimeGravityt", namesf)
  namesf<-gsub("\\()", "", namesf)
  namesf<-gsub("-", "", namesf)
  colnames(final)<-namesf
  write.table(final, "dataoutput.txt", col.names=TRUE)
}