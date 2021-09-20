# convert-5-safes-word-docs.R
# andy south 2021-09-20


# to convert documentation from confluence to markdown on github

# workflow
# ~ manually export each page to a word doc from confluence
# ~ add 01, 02 etc to start of filenames to show order
# ~ manually open each file in word & save to docx (pandoc can't cope with doc)
# ~ move docx files
# ~ run this script to convert all to markdown


# make a vector of the names of all input docx files

#dir('documents\\five-safes\\old-word-docs')


library(here) #helps avoid issues finding files

#this returns the path too
filenames <- here(dir(pattern='.docx$', recursive=TRUE))

# path for outputs
#path <- 'documents\\five-safes\\'

#rmarkdown::pandoc_convert(filename, to = "markdown", output=paste0(filename,".md"))

# works for 1 file
rmarkdown::pandoc_convert(filenames[1], to = "markdown", output=paste0(filenames[1],".md"))

#this does for all files & removes the .docx from output filename
library(stringr)
lapply(filenames, function(x) rmarkdown::pandoc_convert(x, to="markdown", output=paste0(stringr::str_remove(x,".docx"),".md")))