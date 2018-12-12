#simpli.fi
#remove colummns to match only address fields

write_new_csv_simpli <- function(x){
  
  file_name <- paste(filename, '-', 'simplifi', '-', i,'.csv', sep = '')
  write.csv(temp_df, file = file_name, row.names = FALSE, quote = FALSE, na = '')
}


#start here after selcting file and file name
library(tidyverse)

colnames(file)
keep_cols <- (colnames(file) %in% c('RDIR', 'RCITY', 'RSTATE', 'RZIP'))
file_simplifi <- file[keep_cols]
head(file_simplifi, n = 10)

names(file_simplifi) <- c('Address', 'City', 'State',	'Zip Code')
head(file_simplifi)

#back to writing csv as normal
#break into n parts
#set x to number of rows

x <- 500000
n <- ceiling(nrow(file_simplifi)/ x)
N<- c(0:(n-1))
i<-0

#run over file every 500k rows
for(i in N) {
  keep_rows <- c((i*x):(i*x + x))
  temp_df <- file_simplifi[keep_rows,]
  write_new_csv_simpli(temp_df)
}
