#Twitter

#remove colummns to match only address fields
write_new_csv_tw <- function(x){
  
  file_name <- paste(filename, '-Tw-', i,'.csv', sep = '')
  write.csv(temp_df, file = file_name, row.names = FALSE, quote = FALSE, na = '')
}

#start here after selcting file and file name
library(tidyverse)

colnames(file)
keep_cols <- (colnames(file) %in% c('PHONE', 'EMAIL'))
file_tw <- file[keep_cols]

names(file_tw) <- c('Phone',	'Email')

head(file_tw, n=20)

#back to writing csv as normal
#break into n parts
#set x to number of rows

x <- 500000
n <- ceiling(nrow(file_tw)/ x)
N<- c(0:(n-1))
i<-0

#file name
#filename <- 'lean_yes'

#run over file every 500k rows
for(i in N) {
  keep_rows <- c((i*x):(i*x + x))
  temp_df <- file_tw[keep_rows,]
  write_new_csv_tw(temp_df)
}

