#add to github 
#write csv function
write_new_csv <- function(x){
  
  file_name <- paste(filename, ' - ', i,'.csv', sep = '')
  write.csv(temp_df, file = file_name, row.names = FALSE, quote = FALSE, na = '')
}

#choose list

file<- read.csv(filename<-file.choose(), stringsAsFactors = FALSE, encoding = 'UTF-8', quote = "")
head(file, n =2)

filename<- gsub(pattern = "\\s", replacement = "\\1", basename(filename))
nrow(file)

#head to platform specific list formats if necessary

#remove columns
#to_remove <- c(2,3)
#voter_file <- file[,-to_remove]
#head(file, n =2)

#enter number of lines to break on x
x <- 500000
#break into n 500k row sections
n <- ceiling(nrow(file)/ x)
N <- c(0:(n-1))
i <- 0

#run over file every 500k rows
for(i in N) {
  keep_rows <- c((i*x):(i*x + x))
  temp_df <- file[keep_rows,]
  write_new_csv(temp_df)
}

