get.activity.label.table <- function(in.destination.dir)
{
    # Contstants
    activity.file.name <- "activity_labels.txt"
    activity.fullpath.file.name <- paste(in.destination.dir, activity.file.name, sep="/")
    act.label.table <- data.frame()
    
    if(file.exists(activity.fullpath.file.name)) {
      act.label.table <- read.table(activity.fullpath.file.name, sep = " ", stringsAsFactors = FALSE, colClasses = c("integer", "character"), col.names = c("activity.id", "activity.description"))
      
    }
    else { 
      print("file does not exist")
    }
 
    act.label.table 
}
