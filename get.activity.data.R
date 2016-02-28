get.activity.data <- function(in.destination.dir, in.file.name) {
  
  # Constants
  activity.file.name <- paste(in.destination.dir, in.file.name, sep="/")
  
  activity.df <- data.frame()
  
  if(file.exists(activity.file.name)) {
    activity.df <- read.table(activity.file.name, sep="", stringsAsFactors = FALSE, colClasses = c("integer"), col.names = c("activity.id"))
    
  }
  else
  {
    print("Unable to find the activity file.")
  }
  
  
  activity.df
  
  
}