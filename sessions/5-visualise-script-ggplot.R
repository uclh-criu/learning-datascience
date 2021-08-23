# 5-visualise-script-ggplot.R

# makes a line a comment & not actioned by R
"hello" # can also make a comment after something that is executed

# load needed packages
library(tidyverse)

# read in the data
cchic <- read_csv("data/clean_CCHIC.csv")

names(cchic)
# [1] "lactate_abg"       "ph_abg"            "hco3_abg"          "temp_c"            "temp_nc"           "urea"              "creatinine"       
# [8] "na"                "k"                 "hb"                "wbc"               "neutrophil"        "platelets"         "crp"              
# [15] "chemo"             "chronic_rrt"       "metastatic"        "radiotx"           "apache"            "medical"           "system"           
# [22] "height"            "weight"            "elective_surgical" "arrival_dttm"      "discharge_dttm"    "dob"               "vital_status"     
# [29] "sex"               "nhs_number"        "age_years"     


# single variable barplots for categorical data
ggplot(cchic) +
  geom_bar(aes(x = sex))

ggplot(cchic) +
  geom_bar(aes(x = vital_status))


# single variable histograms for continuous data
ggplot(cchic) +
  geom_histogram(aes(x = weight))

# changing the number of bins
ggplot(cchic) +
     geom_histogram(aes(x = weight), bins=20)

ggplot(cchic) +
  geom_histogram(aes(x = age_years))


# scatterplots - may not show much when lots of data, points overlay each other

ggplot(cchic) +
  geom_point(aes(x=age_years, y=weight))


# scatterplots with colour

ggplot(cchic) +
  geom_point(aes(x=age_years, y=weight, colour=sex))


# can also set colour based on a continuous variable
# (here reduntant because same as axis, but does illustrate the point)
ggplot(cchic) +
   geom_point(aes(x=age_years, y=weight, colour=weight))


# faceting (putting plots into different panels according to data values)
# Useful !

ggplot(cchic) +
  geom_bar(aes(x = weight)) +
  facet_wrap(vars(sex))

# add colour fill
ggplot(cchic) +
  geom_bar(aes(x = weight, fill=sex)) +
  facet_wrap(vars(sex))

# smoothed fitted lines

ggplot(cchic) +
  geom_smooth(aes(x=height, y=weight, linetype=sex))

ggplot(cchic) +
  geom_smooth(aes(x=height, y=weight, linetype=as.factor(chemo)))


###################################################
# adding themes to alter how the whole plot appears

ggplot(cchic) +
  geom_smooth(aes(x=height, y=weight, linetype=as.factor(chemo))) +
  theme_bw()

ggplot(cchic) +
  geom_smooth(aes(x=height, y=weight, linetype=as.factor(chemo))) +
  theme_minimal()

# you can assign plots to an object & then modify it after

#initially doesn't print because you have assigned to an object
myplot <- ggplot(cchic) +
  geom_smooth(aes(x=height, y=weight, linetype=as.factor(chemo)))
#now does print
myplot + theme_dark()


###################################
# changing colour scales

ggplot(cchic) +
  geom_point(aes(x=age_years, y=weight, colour=weight))

ggplot(cchic) +
  geom_point(aes(x=age_years, y=weight, colour=weight)) +
  scale_colour_continuous(type = "viridis")
  


