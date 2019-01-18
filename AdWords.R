#AdWords
#remove colummns to match only address fields

#worth adding to differentiate platforms?
write_new_csv_ads <- function(x){
  
  file_name <- paste(filename, '-', 'AdWords', '-', i,'.csv', sep = '')
  write.csv(temp_df, file = file_name, row.names = FALSE, quote = FALSE, na = '')
}

<<<<<<< HEAD
########################
=======
>>>>>>> 014a690176486e52ff1c80753abe022d795fb204
##START
#start here after selcting file and file name
library(tidyverse)

Country <- 'US'

colnames(file)
keep_cols <- (colnames(file) %in% c('FNAME', 'LNAME', 'RCOUNTRY', 'RZIP', 'PHONE', 'WPHONE', 'EMAIL'))
file_ads <- file[keep_cols]

names(file_ads) <- c('First Name',	'Last Name',	'Zip',	'Phone', 'Phone2',	'Email')

file_ads <- cbind(file_ads, Country)
head(file_ads)

<<<<<<< HEAD
file_ads <- file_ads %>% mutate(Phone = coalesce(Phone, Phone2)) %>%
  select(`First Name`, `Last Name`, Zip, Phone, Email, Country)
head(file_ads)

=======
>>>>>>> 014a690176486e52ff1c80753abe022d795fb204
#back to writing csv as normal
#enter number of lines to break on x
x <- 500000
#break into n parts of size x
n <- ceiling(nrow(file_ads)/ x)
N<- c(0:(n-1))
i<-0

#file name
<<<<<<< HEAD
#filename <- ''
=======
#filename <- 'lean_yes'
>>>>>>> 014a690176486e52ff1c80753abe022d795fb204

#run over file every 500k rows
for(i in N) {
  keep_rows <- c((i*x):(i*x + x))
  temp_df <- file_ads[keep_rows,]
  write_new_csv_ads(temp_df)
}

