get.measurements <- function(in.destination.dir, in.file.name) {
  
  # Constants
  measurement.fullpath.filename <- paste(in.destination.dir, in.file.name, sep = "/")
  measurement.df = data.frame()
  
  
  if(file.exists(measurement.fullpath.filename)) {
    
    # Using scan() here instead of read.table. The source file has a lot
    # of multiple space separators. Scan() ignores them but read.table()
    # generates NA entries.
    file.scanned <- scan(measurement.fullpath.filename)
    
    # Check for missing values
    if(sum(is.na(file.scanned))) { 
      print("NA values found.")
    }
    
    # data values are read into a vector
    a.data.matrix <-matrix(file.scanned,  ncol = 561, byrow = TRUE)
    
    # Convert to a data frame
    measurement.df <- as.data.frame.matrix(a.data.matrix, stringsAsFactors = FALSE)
    
  }
  else {
    print("Measurement file is not available.")  
  }
  
  measurement.df
   
}