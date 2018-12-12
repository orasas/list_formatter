#LiveRamp
#remove colummns to match only address fields
write_new_csv_LR <- function(x){
  
  file_name <- paste(filename, '-LR -', i,'.csv', sep = '')
  write.csv(temp_df, file = file_name, row.names = FALSE, quote = FALSE, na = '')
}

#start here after selcting file and file name
library(tidyverse)

colnames(file)
keep_cols <- (colnames(file) %in% c('PRIM_ID', 'FNAME', 'LNAME','RDIR', 'RCITY', 'RSTATE', 'RZIP', 'RZIP4', 'EMAIL', 'PHONE', 'WPHONE'))
file_liveramp <- file[keep_cols]
names(file_liveramp) <- c('Client Customer ID',	'First Name',	'Last Name',	'Street Address',	'City',	'State',	'Zip Code',	'Zip Plus 4',	'PhoneNumber', 'PhoneNumber2',	'Email')
head(file_liveramp)

#back to writing csv as normal
#break into n parts
#set x to number of rows

x <- 500000
n <- ceiling(nrow(file_liveramp)/ x)
N<- c(0:(n-1))
i<-0

#file name
#filename <- 'lean_yes'

#run over file every 500k rows
for(i in N) {
  keep_rows <- c((i*x):(i*x + x))
  temp_df <- file_liveramp[keep_rows,]
  write_new_csv_LR(temp_df)
}

