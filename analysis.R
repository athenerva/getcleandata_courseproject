analyze <- function() {

        library(dplyr)
        
        ## 1. Merges the train and test data sets
        
        ## Merge the X datasets from train and test folders
        train_x_df <- read.table("UCI HAR Dataset\\train\\X_train.txt", sep="")
        test_x_df <- read.table("UCI HAR Dataset\\test\\X_test.txt", sep = "")
        x_df <- rbind(train_x_df, test_x_df)
        
        ## Merge the Y datasets from train and test folders
        train_y_df <- read.table("UCI HAR Dataset\\train\\y_train.txt", sep="")
        test_y_df <- read.table("UCI HAR Dataset\\test\\y_test.txt", sep = "")
        y_df <- rbind(train_y_df, test_y_df)
        
        ## Merge the subject datasets from train and test folders
        subject_train_df <- read.table("UCI HAR Dataset\\train\\subject_train.txt", sep = "")
        subject_test_df <- read.table("UCI HAR Dataset\\test\\subject_test.txt", sep = "")
        subject_df <- rbind(subject_train_df, subject_test_df)
        
        # Read the names of the features - 561 features
        feature_df <- read.table("UCI HAR Dataset\\features.txt", sep = " ")
        
        # Read the activity table - shows mapping of activity name to class label
        activity_df <- read.table("UCI HAR Dataset\\activity_labels.txt", sep = " ")
        
        ## Name columns
        names(y_df) <- "activity_code"
        names(subject_df) <- "subject"
        names(x_df) <- feature_df$V2
        
        ## Create one large data set
        merged_df <- cbind(subject_df, y_df, x_df)
        
        ## --------------------------------------------------------------------------
        
        ## 2. Extract only mean and standard deviation for each measurement
        
        cnames <- names(merged_df)
        mean_index <- grep("*mean\\(\\)*", cnames)
        std_index <- grep("*std\\(\\)*", cnames)
        
        subset_df <- merged_df[, c(1, 2, mean_index, std_index)]
        
        ## --------------------------------------------------------------------------
        
        ## 3. Assign descriptive activity names to the activity column
        
        for (i in unique(subset_df$activity_code)) {
                subset_df$activity_code <- gsub(i, activity_df$V2[i], subset_df$activity_code)
        }
        
        ## --------------------------------------------------------------------------
        
        ## 4. Label data set with descriptive names
        
        cnames2 <- names(subset_df)
        mean_index2 <- grep("*mean\\(\\)*", cnames2)
        std_index2 <- grep("*std\\(\\)*", cnames2)
        
        for (i in mean_index2) {
                old_name <- cnames2[i]
                fname <- strsplit(old_name, "-")[[1]]
                
                if (length(fname) > 2) {
                        new_name <- paste("mean", fname[1], fname[3], sep="_")
                }
                
                else {
                        new_name <- paste("mean", fname[1], sep="_")
                }
                cnames2[i] <- new_name
        }
        
        for (i in std_index2) {
                old_name <- cnames2[i]
                fname <- strsplit(old_name, "-")[[1]]
                
                if (length(fname) > 2) {
                        new_name <- paste("std_dev", fname[1], fname[3], sep="_")
                }
                
                else {
                        new_name <- paste("std_dev", fname[1], sep="_")
                }
                cnames2[i] <- new_name
        }
        
        names(subset_df) <- cnames2
        
        ## --------------------------------------------------------------------------
        
        ## 5. Create a new, independent, tidy data set with average of each variable
        ##      for each activity and each subset
        
        group_df <- subset_df %>% group_by(subject, activity_code) 
        tidy_df <- summarize_each(group_df, funs(mean))
        
        ## Write new table to a file
        write.table(tidy_df, file = "tidy_dataset.txt")
}