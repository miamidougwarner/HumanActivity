get.volunteer.data <- function(in.destination.dir, in.file.name) {
  
  
    # Constants
    volunteer.file.name <- paste(in.destination.dir, in.file.name, sep="/")
    volunteer.df <- data.frame()
    
    
    
    if(file.exists(volunteer.file.name)) {
      
      # consume the Training volunteers
      volunteer.df <- read.table(volunteer.file.name, sep = "", stringsAsFactors = FALSE, colClasses = c("integer"), col.names = c("volunteer.id"))
      
    }
    else {
      print("Unable to find the volunteer/subject file.")
    }
    
    
    volunteer.df
}