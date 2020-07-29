library(dplyr)

#Load "feature"
df.features<-read.table("features.txt",sep="",header=FALSE)
class(df.features[2])

##Load "test"
df.subject_test<-read.table("test/subject_test.txt",sep="",header=FALSE)
df.X_test<-read.table("test/X_test.txt",sep="",header=FALSE)
df.y_test<-read.table("test/y_test.txt",sep="",header=FALSE)

#Define data frame for "test"
df.test<-as.data.frame(c(df.subject_test,df.y_test,df.X_test))
colnames(df.test)<-c("subject","activity",df.features[,2] )

#Load "train"
df.subject_train<-read.table("train/subject_train.txt",sep="",header=FALSE)
df.X_train<-read.table("train/X_train.txt",sep="",header=FALSE)
df.y_train<-read.table("train/y_train.txt",sep="",header=FALSE)

#Define data frame for "train"
df.train<-as.data.frame(c(df.subject_train,df.y_train,df.X_train))
colnames(df.train)<-c("subject","activity",df.features[,2] )

#Binding data frames
df<-rbind(df.test,df.train)

#Ordening data frames
df<-df[order(df$subject),]

#filter colums
col<-grep("mean()|std()",colnames(df))
df<-df[,c(1,2,col)]

#Generate averages through loops
df.new<-df[df[,1] %in% c("1")& df[,2] %in% c("1") ,1:81]
df.new<-sapply(df.new,mean)


  for(j in 2:6){
    df.new.new<-df[df[,1] %in% c("1")& df[,2] %in% c(j) ,1:81]
    df.new.new<-sapply(df.new.new,mean)
    df.new<-rbind(df.new,df.new.new)
  }
  


for(i in 2:30){
  for(j in 1:6){
    df.new.new<-df[df[,1] %in% c(i)& df[,2] %in% c(j) ,1:81]
    df.new.new<-sapply(df.new.new,mean)
    df.new<-rbind(df.new,df.new.new)
  }
  
}

df.clear<-data.frame(df.new)

#Ready
df.clear







