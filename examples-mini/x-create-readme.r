# x-create-readme.r

### script to create the readme file for the mini examples

# aims to make the examples self-documenting
# i.e. the comments in the files are used to create the documentation
# reduces risk that code & docs diverge
# to work it needs the 2nd non empty line of the scripts to contain the description 
# & ideally that the line starts with ### to make nice markdown formatting
# this script doesn't use the first line of each file - gets name from the filename
# again reduces risk that filenames & docs diverge

# uses R to list files, read each mini example and write two lines for each into the readme 

filenames <- list.files("examples-mini","*.r")

#text_for_readme <- NULL
text_for_readme <- "# Mini self-contained examples demonstrating coding solutions for patient data\n\n"

for (i in filenames) {
  
  # cat(i)
  
  # first_lines <- read_lines(paste0('examples-mini/',i), skip_empty_rows=TRUE, n_max=2)
  # text_for_readme <- c(text_for_readme,'\n',first_lines)
  
  #I could instead skip the first line & use the filename instead  
  line2 <- read_lines(paste0('examples-mini/',i), skip_empty_rows=TRUE, n_max=1, skip=1)
  line1 <- paste0("##",i,"\n")
  
  text_for_readme <- c(text_for_readme,'\n', line1, line2)  
  
}

# write the lines to a markdown file
write_lines(text_for_readme, 'examples-mini/readme-examples-mini.md')