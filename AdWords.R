#AdWords
#remove colummns to match only address fields

##START
#start here after selcting file and file name
write_new_csv_adwords <- function(x){
  
  file_name <- paste(filename, '-', 'AdWords', '-', i,'.csv', sep = '')
  write.csv(temp_df, file = file_name, row.names = FALSE, quote = FALSE, na = '')
}


library(tidyverse)

Country <- 'US'

colnames(file)
keep_cols <- (colnames(file) %in% c('FNAME', 'LNAME', 'RCOUNTRY', 'RZIP', 'PHONE', 'WPHONE', 'EMAIL'))
file_ads <- file[keep_cols]

names(file_ads) <- c('First Name',	'Last Name',	'Zip',	'Phone', 'Phone',	'Email')

cbind(file_ads, Country)
head(file_ads)

#back to writing csv as normal
#break into n parts
#set x to number of rows

x <- 500000
n <- ceiling(nrow(file_ads)/ x)
N<- c(0:(n-1))
i<-0

#run over file every 500k rows
for(i in N) {
  keep_rows <- c((i*x):(i*x + x))
  temp_df <- file_ads[keep_rows,]
  write_new_csv_adwords(temp_df)
}

