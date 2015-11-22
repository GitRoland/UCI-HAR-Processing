
## creates 2 tidy data frames from the test and training data files of the UCI 
## HAR Dataset.  The "R" working directory should be set to local root directory
## containing the HAR files (and the "test" and "train" subdirectories).
##
## on the author's computer: setwd("C:/dataCleaningProject/UCI HAR Dataset")

run_analysis <- function()
{
    library(readr) 
    library(plyr)

    #---- read activity labels ----
    activities = readLines("activity_labels.txt")

    #--- MERGE subject ids from train/test data (char, range: 1..30) ----
    trainSubjects = readLines("train\\subject_train.txt")
    testSubjects = readLines("test\\subject_test.txt")
    subjects = c(trainSubjects, testSubjects)
    
    #--- MERGE label ids from train/test data ----
    trainLabels = readLines("train\\y_train.txt")
    testLabels = readLines("test\\y_test.txt")
    labels = c(trainLabels, testLabels)
    
    #--- MERGE feature data from train/test data ----
    cw = rep(16, 561)
    trainFeatures = read_fwf(file="train\\x_train.txt", fwf_widths(cw))
    testFeatures = read_fwf(file="test\\x_test.txt", fwf_widths(cw))
    features = rbind(trainFeatures, testFeatures)
    
    #--- translate labels from activities ids to strings ----
    labelStrings = sapply(labels, function(d) activities[as.numeric(d)], USE.NAMES=FALSE)
    
    #---- read feature names and use them to label the columns of "features" ----
    allFeatureNames = readLines("features.txt")
    colnames(features) = allFeatureNames

    #---- extract feaure columns with "std" or "mean" in their name ---    
    featureNames = allFeatureNames[grep("std|mean", allFeatureNames)]
    finalFeatures = features[,featureNames]
    
    #---- create the DATA FRAME from finalFeatures, subjects, and labels ----
    df = data.frame(subjectIds=subjects, activityLabels=labelStrings, finalFeatures)
    
    #--- group by activty, subject and calc mean for all numeric cols ----
    df2 = aggregate(df[,3:81], list(df[,1], df[,2]), mean)
    
    #---- fix up order/labels of first 2 columns ----
    df2[,1:2] = df2[,2:1]
    df2 = rename(df2, c("Group.2"="Subject.Id", "Group.1"="Activity.Label"))
    
    return(df2)
}


