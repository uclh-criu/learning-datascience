#03-manipulate-plot-query-results.R

#revise manipulating & plotting data with dplyr & ggplot2

library(tidyverse)

# another query returning more data - 1 month of oxygen measurements

qfromfile <- readr::read_file("database-use/sql-omop-scripts/measures-all-patients-daterange.sql")

df4 <- DBI::dbGetQuery(ctn, qfromfile)

#first plot
ggplot(df4, aes(x=measurement_datetime, y=`oxygen saturation`)) +
  geom_point()

# now can we manipulate these data using dplyr & plot using ggplot ?
