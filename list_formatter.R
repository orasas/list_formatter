#choose list

file <- read.csv(filename<-file.choose(), stringsAsFactors = FALSE, encoding = 'UTF-8', quote = "")
head(file, n =2)

filename<- gsub(pattern = "\\s", replacement = "\\1", basename(filename))
nrow(file)

#write csv function
write_new_csv <- function(x){
  
  file_name <- paste(filename, '-', i,'.csv', sep = '')
  write.csv(temp_df, file = file_name, row.names = FALSE, quote = FALSE, na = '')
}

#head to platform specific list formats if necessary

#break into n x row sections
#set x to number of rows

x <- 500000
n <- ceiling(nrow(file)/ x)
N<- c(0:(n-1))
i<-0

#run over file every 500k rows
for(i in N) {
  keep_rows <- c((i*x):(i*x + x))
  temp_df <- file[keep_rows,]
  write_new_csv(temp_df)
}

