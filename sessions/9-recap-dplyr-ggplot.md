Recap dplyr & ggplot2 for data science fellows
================

# Working session 2021-12-06

## Objectives

**Overall : recap data manipulation & plotting in R**

1.  \[repeat from last session\] get most recent ‘learning-datascience’
    project from Github into RStudio

2.  create new RStudio project for own work

3.  recap dplyr (data manipulation) & ggplot2 (plotting)

## recap dplyr (data manipulation) & ggplot2 (plotting)

We introduced the packages dplyr & ggplot2 in the first R course.

Here is a quick reminder of some important dplyr if you haven’t had a
chance to use much.

dplyr & ggplot2 packages both part of the tidyverse,
`library(tidyverse)`

In tidy data, columns are variables & rows are observations

### dplyr

The 4 main commands :

``` 
`select()` picks variables (COLUMNS) based on their names.   
`filter()` picks cases (ROWS) based on their values.   
`summarise()` reduces multiple values down to a single summary.   
`group_by()` allows you to perform operations “by group” particularly summarise.   
```

`%>%` the pipe, passes the result of one function to another

Some examples from the R course :

Filter rows by age, then selecting just a single column.

``` r
cchic %>%
  filter(age_years >= 65) %>%
  select(sex)
```

Grouping to calculate a summary.

``` r
cchic %>%
  group_by(sex) %>%
  summarise(mean_urea = mean(urea, na.rm=TRUE))
```

### ggplot2

    ggplot(DATA) + GEOM(aes(x=COLUMN to set aesthetics))

example from the R course

``` r
ggplot(cchic) +
  geom_point(aes(x=age_years, y=weight, colour=sex))
```

Now have a look at this file in the RStudio project :
`database-use/03-manipulate-plot-query-results.R`

It uses dplyr & ggplot2 on the decovid omop data.
