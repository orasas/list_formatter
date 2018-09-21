#LiveRamp
#remove colummns to match only address fields

#start here after selcting file and file name
library(tidyverse)

Country <- 'US'

colnames(file)
keep_cols <- (colnames(file) %in% c('FNAME', 'LNAME', 'RCOUNTRY', 'RZIP', 'PHONE', 'WPHONE', 'EMAIL'))
file_ads <- file[keep_cols]

names(file_ads) <- c('First Name',	'Last Name',	'Zip',	'Phone', 'Phone',	'Email')

rbind(file_ads, Country)
head(file_ads)

#back to writing csv as normal
#break into n parts
n <- ceiling(nrow(file_liveramp)/ 500000)
N<- c(0:(n-1))
i<-0

#file name
filename <- 'lean_yes'

#run over file every 500k rows
for(i in N) {
  keep_rows <- c((i*500000):(i*500000 + 500000))
  temp_df <- file_liveramp[keep_rows,]
  write_new_csv(temp_df)
}
