# missing-data-formatting

# format missing data values correctly (NA)

# NA is the code that R uses to represent missing data.
# It does not have quotes. "NA" or "missing" will give different behaviour and are not recommended.
# This shows how to format missing values correctly if they are not.

library(tidyverse) #for packages dplyr

# create a small example dataframe
df1 <- data_frame( numbers = c(1,3,0.5,"missing","NA"),
                   text = c("a","b","c","missing","NA"))

# missing values can be represented in numeric and character data

# in the numbers column above R stores the data as characters 
# and the missing values are not formatted correctly
# if we use as.numeric() then anything that is not a number will be converted to NA

df2 <- df1 %>% 
  mutate(numbers2 = as.numeric(numbers)) 

df2

#   numbers    text numbers2
# 1       1       a      1.0
# 2       3       b      3.0
# 3     0.5       c      0.5
# 4 missing missing       NA
# 5      NA      NA       NA

# note in this display the "NA" stored as character in column1 looks the same as that in column3
# they are different

# To convert the missing values in the text column to the correct format
# we need to specify which text values we want to convert to NA
# in this case "missing" and "NA"
# easiest way is probably to use na_if() function that converts argument to NA
# but you need to repeat for each

df2 <- df1 %>% 
  mutate(text2 = na_if(text, "NA")) %>% 
  mutate(text2 = na_if(text2, "missing")) 

df2

# numbers    text text2
# 1       1       a     a
# 2       3       b     b
# 3     0.5       c     c
# 4 missing missing  <NA>
# 5      NA      NA  <NA>
