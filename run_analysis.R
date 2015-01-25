setwd("~/coursera/Getting data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train")

subject_train <- read.table("../train/subject_train.txt")
x_train <- read.table("../train/X_train.txt")
y_train <- read.table("../train/Y_train.txt")
dim(subject_train)
dim(x_train)
dim(y_train)


setwd("~/coursera/Getting data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")
dim(x_test)
dim(y_test)
dim(subject_test)

test <- cbind(subject_test, y_test, x_test)
train <- cbind(subject_train, y_train, x_train)

all <- rbind(train, test)


features <- read.table("../features.txt")
 
v <- as.vector(features$V2)

v1 <- make.names(v)

v2 <- c("subject", "activity", v1)
names(all) <- v2

all1 <- all[, c(1,2,grep("\\.(mean|std)\\.", names(all), perl=T))];

activity_names <- read.table("..//activity_labels.txt")

names(activity_names) <- c("activity", "activity_name")


all2 <- merge(all1, activity_names)

all3 <- all2[, -1]

library(dplyr)


all4 <- group_by(all3, subject, activity_name)

tidy_data <- all4 %>% summarise_each(funs(mean))

