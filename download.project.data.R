download.project.data <- function(in.destination.file, in.destination.dir) {
  #
  #
  # download and extract the data set to my local directory
  
  project.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
 
  
  if(!file.exists(in.destination.file)) {
    download.file(project.url, in.destination.file, "auto")
    date.downloaded <- date()
    
    unzip(in.destination.file, exdir = in.destination.dir, junkpaths = TRUE)
  }
  
  
}