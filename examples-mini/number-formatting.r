# number-formatting.r

# convert data to number format when it has been read in as character (using as.numeric())

# Sometimes when you read numeric data in from a database or file it gets formatted
# as character. This can limit what you can do with the data.
# It can happen when there are some non-numeric data in a column.

library(tidyverse) # for packages dplyr

# create a small example dataframe
df1 <- data_frame( measure = c(1,3,0.5,"missing"))

# str shows that measure is formatted as character 'chr'
str(df1)

# if we try to get the difference between two values stored as a character we will get an error
df1$measure[2] - df1$measure[1]

#Error in df1$measure[2] - df1$measure[1] : non-numeric argument to binary operator

# use as.numeric() to convert to number format
# here we use mutate to create a new column so we can see what has happened to the data
df1 <- mutate(df1, measure_num = as.numeric(measure))

# You may get this warning for any values that cannot be converted to numbers
# They are converted to NA instead - R's code for missing data

# Warning message:
#   Problem with `mutate()` column `measure_num`.
# i `measure_num = as.numeric(measure)`.
# i NAs introduced by coercion 

str(df1)
# $ measure    : chr [1:4] "1" "3" "0.5" "missing"
# $ measure_num: num [1:4] 1 3 0.5 NA

# Now R will give the difference between two measures
df1$measure_num[2] - df1$measure_num[1]
#[1] 2

# compare and contrast what happens if you plot the character data with the numeric data

ggplot(df1, aes(x=measure_num,y=measure_num)) + geom_point()

ggplot(df1,aes(x=measure,y=measure)) + geom_point()

#(when plotting character data each value is shown equidistant which can be misleading)
