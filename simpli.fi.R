#simpli.fi
#remove colummns to match only address fields

#start here after selcting file and file name
library(tidyverse)

colnames(file)
keep_cols <- (colnames(file) %in% c('RDIR', 'RSTREET', 'RTYPE', 'RCITY', 'RZIP'))
file_simplifi <- file[keep_cols]
head(file_simplifi)

#back to writing csv as normal
#break into n parts
n <- ceiling(nrow(file_simplifi)/ 500000)
N<- c(0:(n-1))
i<-0

#run over file every 500k rows
for(i in N) {
  keep_rows <- c((i*500000):(i*500000 + 500000))
  temp_df <- file_simplifi[keep_rows,]
  write_new_csv(temp_df)
}
