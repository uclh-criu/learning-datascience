# diagnosis-name-search-exact

# search diagnoses to find those that exactly match one of a number of strings 

library(tidyverse) #for packages dplyr

# create a small example dataframe with just one column
df1 <- data_frame( diagnosis = c('Hodgkins Lymphoma','other','Hodgkins','Lymphoma'))

# 1. to match just one string
wanted <- 'Hodgkins Lymphoma' 

# mutate creates a column containing TRUE if the entry in the diagnosis column
# exactly matches the search string
# (you can replace 'newcolumn' with the name you want for the new column)
df2 <- df1 %>% 
  mutate(newcolumn = (diagnosis == wanted))

# to view resulting dataframe
df2

# diagnosis         newcolumn
# 1 Hodgkins Lymphoma TRUE     
# 2 other             FALSE    
# 3 Hodgkins          FALSE    
# 4 Lymphoma          FALSE   

# 2. to match find an exact match to more than one string
wanted <- c('Hodgkins Lymphoma','Hodgkins') 

# %in% checks whether each diagnosis is found in the ones we want
df2 <- df1 %>% 
  mutate(newcolumn = (diagnosis %in% wanted))

# to view resulting dataframe
df2

# diagnosis         newcolumn
# 1 Hodgkins Lymphoma TRUE     
# 2 other             FALSE    
# 3 Hodgkins          TRUE     
# 4 Lymphoma          FALSE  

# to create a new dataframe containing just the rows matching
# filter out rows
# then select just the column(s) we need
df3 <- df2 %>% 
  filter(newcolumn==TRUE) %>% 
  select(diagnosis)