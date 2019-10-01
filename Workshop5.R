library(ggplot2)

# You need to load the dataset called 'cchic'.
# You need the version you created yesterday. It contains the variable called 'los'

# Creating a dot plot.

ggplot(data = cchic) +
  geom_point(mapping = aes(x = age_years, y = los))

# adding colour

ggplot(data = cchic) +
  geom_point(mapping = aes(x = age_years, y = los, color = vital_status))

# using size

ggplot(data = cchic) +
  geom_point(mapping = aes(x = age_years, y = los, size = vital_status))

# using shape

ggplot(data = cchic) +
  geom_point(mapping = aes(x = age_years, y = los, shape = sex))

ggplot(data = cchic) +
  geom_point(mapping = aes(x = age_years, y = los, size = vital_status, shape = sex))
# you can combine different aesthetics

# spot the difference

ggplot(data = cchic) +
  geom_point(mapping = aes(x = age_years, y = sodium), color = "blue")

ggplot(data = cchic) +
  geom_point(mapping = aes(x = age_years, y = sodium, color = "blue"))
# can you figure out why this happened?

# making subplots/facets

ggplot(data = cchic) +
  geom_point(mapping = aes(x = weight, y = los)) +
  facet_wrap(~sex, nrow = 2)

# including all data points

ggplot(data = cchic) +
  geom_point(mapping = aes(x = age_years, y = los))
# We can see fewer datapoints than there actually are. 

# Some points are on top of each other. This moves them a little bit so you can see them all.
ggplot(data = cchic) +
  geom_point(mapping = aes(x = age_years, y = los), position = "jitter")
