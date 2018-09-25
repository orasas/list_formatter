#LiveRamp
#remove colummns to match only address fields

#start here after selcting file and file name
library(tidyverse)

colnames(file)
keep_cols <- (colnames(file) %in% c('PRIM_ID', 'FNAME', 'LNAME','RDIR', 'RCITY', 'RSTATE', 'RZIP', 'RZIP4', 'EMAIL', 'PHONE', 'WPHONE'))
file_liveramp <- file[keep_cols]
names(file_liveramp) <- c('Client Customer ID',	'First Name',	'Last Name',	'Street Address',	'City',	'State',	'Zip Code',	'Zip Plus 4',	'PhoneNumber', 'PhoneNumber2',	'Email')
head(file_liveramp)

#back to writing csv as normal
#break into n parts
n <- ceiling(nrow(file_liveramp)/ 500000)
N<- c(0:(n-1))
i<-0

#file name
#filename <- 'lean_yes'

#run over file every 500k rows
for(i in N) {
  keep_rows <- c((i*500000):(i*500000 + 500000))
  temp_df <- file_liveramp[keep_rows,]
  write_new_csv(temp_df)
}

