# run_analysis

library(dplyr)
library(reshape2)
library(lubridate)


# Constants
  destination.file <- "/home/doug/Documents/Education/Coursera/03_Getting Cleaning Data/Week 4/project/dataset.zip"
  destination.dir <- "/home/doug/Documents/Education/Coursera/03_Getting Cleaning Data/Week 4/project/dataset"
  
  

# download the experiment archive and extract the data set to my local directory

	result <- download.project.data(destination.file, destination.dir)


	# Read in the measurement column headings
  feature.file.name <- paste(destination.dir, "features.txt", sep="/")	
  feature.table <- read.table(feature.file.name, sep=" ", stringsAsFactors = FALSE, colClasses = c("integer", "character"), col.names = c("measure.no", "measure.description"))
  
  # The column headings are illegal in R.
  # Shall use make.names() to ensure they are unique.
  unique.column.names <- make.names(feature.table$measure.description, unique = TRUE)
  
  
  
  # Fetch the measurement data
  training.measurements <- get.measurements(destination.dir, "X_train.txt")
  test.measurements <- get.measurements(destination.dir, "X_test.txt")
  
  # And attach their column headings (step 4)
  training.measurements <- setNames(training.measurements, unique.column.names)
  test.measurements <- setNames(test.measurements, unique.column.names)
  
  
  # Fetch the activity labels from the download
  activity.label.table <- get.activity.label.table(destination.dir)
  
  
  # Now let's fetch the activities
  training.activities <- get.activity.data(destination.dir, "y_train.txt")
  test.activities <- get.activity.data(destination.dir, "y_test.txt")
  
  
  
  # Fetch the volunteer (subject) data
  training.volunteers <- get.volunteer.data(destination.dir, "subject_train.txt")
  test.volunteers <- get.volunteer.data(destination.dir, "subject_test.txt")
  
  
  
  # All the components are loaded, time to assemble the test and training sets.
  training.dataset <- cbind(training.volunteers, training.activities, training.measurements)
  test.dataset <- cbind(test.volunteers, test.activities, test.measurements)
  
  
  
  
  ## ----------------------------------------------------------------
  ## 1. Merges the training and the test sets to create one data set.
  ## ----------------------------------------------------------------
  
  # The volunteers that participated in training are distinct from the
  # volunteers that participated in test.
  # To join the datasets, just attach one to the bottom of the other.
  
  all.volunteers.dataset <- rbind(training.dataset, test.dataset)
  
  
  
  
  
  
  ## --------------------------------------------------------------------------------------------
  ## Q2. Extracts only the measurements on the mean and standard deviation for each measurement.
  ## --------------------------------------------------------------------------------------------
  
  # Columns 1 & 2 are volunteer.id & activity.id. 
  # The rest are normalized measurements.
  all.volunteers.mean.std <- select(all.volunteers.dataset, 1:2, grep("\\.(mean|std)\\.", names(all.volunteers.dataset)))
  
  
  
  ## ----------------------------------------------------------------------------
  ## Q3. Uses descriptive activity names to name the activities in the data set
  ## ----------------------------------------------------------------------------
  
  # The activity.id) in all.volunteers.mean.std contain the activity number.
  # This is the update to string values from the activity label table.
  
  all.volunteers.mean.std <- rename(all.volunteers.mean.std, activity.description = activity.id)
  
  all.volunteers.mean.std <- mutate(all.volunteers.mean.std, 
                                    activity.description = activity.label.table[all.volunteers.mean.std$activity.description, "activity.description"] )
  
  
  
  
  ## ----------------------------------------------------------------------
  ## Q4. Appropriately labels the data set with descriptive variable names.
  ## ----------------------------------------------------------------------
  
  # The column labels had been updated above (before Q1) with these lines:
  ##
  ##    unique.column.names <- make.names(feature.table$measure.description, unique = TRUE)
  ##	training.measurements <- setNames(training.measurements, unique.column.names)
  ##
  # Here is some cleanup to move all column names to lower case.
  
  names(all.volunteers.mean.std) <- tolower(names(all.volunteers.mean.std))
  
  
  
  
  ## ------------------------------------------------------------------------
  ## Q5. From the data set in step 4, creates a second, independent tidy data
  ##     set with the average of each variable for each activity and each 
  ##     subject.
  ## ------------------------------------------------------------------------
  
  # First remove all the standard deviation columns (.std.)
  all.volunteers.mean <- select(all.volunteers.mean.std, volunteer.id, activity.description, grep("\\.(mean)\\.", names(all.volunteers.mean.std)))
  
  # This part melts the dataset. To get the average values, 
  # need to calculate the mean for all the rows first.
  # This statement adds a means column  with all average 
  # of all the normalized mean values.
  
  temp <- mutate(all.volunteers.mean, means = rowMeans(all.volunteers.mean[, -2]))
  
  # Only need: volunteer.id, activity.description & means columns
  temp.means <- select(temp,1,2,36)
  
  # Melt the dataset. Force the column 'means' into the 'value' column
  temp.melt <- melt(temp.means, id=1:2)
  
  # Associate the means value for each volunteer and for each activity
  consolidated.mean.by.activity <- dcast(temp.melt, volunteer.id ~ activity.description, mean)
  
  # Make the column names easier to read by forcing them
  # to lower case.
  names(consolidated.mean.by.activity) <- tolower(names(consolidated.mean.by.activity))
  
  
  # Save the results
  output.file.name <- paste(destination.dir, "consolidated.means.txt", sep="/")
  write.table(consolidated.mean.by.activity, output.file.name, row.names = FALSE)
  

  


  
