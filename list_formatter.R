#add to github
#write csv function
write_new_csv <- function(x){
  
  file_name <- paste(filename, ' - ', i,'.csv', sep = '')
  write.csv(temp_df, file = file_name, row.names = FALSE, quote = FALSE)
}

#choose list

voter_file<- read.csv(filename<-file.choose(), stringsAsFactors = FALSE)
head(voter_file, n =2)
filename<- sub(pattern = "(.*)\\..*$", replacement = "\\1", basename(filename))

#break into n 500k row sections
n <- ceiling(nrow(voter_file)/ 500000)
N<- c(0:(n-1))
i<-0

#run over file every 500k rows
for(i in N) {
  keep_rows <- c((i*500000):(i*500000 + 500000))
  temp_df <- voter_file[keep_rows,]
  write_new_csv(temp_df)
}

