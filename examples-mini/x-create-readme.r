# x-create-readme.r

### script to create the readme file for the mini examples

# aims to make the examples self-documenting
# i.e. the comments in the files are used to create the documentation
# reduces risk that code & docs diverge
# to work it needs the 2nd non empty line of the scripts to contain the description 
# this script doesn't use the first line of each file - gets name from the filename
# again reduces risk that filenames & docs diverge
# ** later I could add numbering by just adding numbering into filenames e.g. 01-filename.r
# ** that would also make it easy to change order

# uses R to list files, read each mini example and write two lines for each into the readme 
# I might be able to tweak this to add a links to the files, but would only work from github

# list the r files in the folder
filenames <- list.files("examples-mini","\\.r$",ignore.case=TRUE)

# first few lines for the reame
text_for_readme <- paste0("# Mini-examples demonstrating coding solutions for patient data\n\n",
                          "A series of independent, self-contained examples in R scripts in this folder. ",
                          "Most come from questions asked by clinicians. ",
                          "Each is like a stackoverflow Q&A. ",
                          "They are targetted at clinicians or analysts who are relatively new to R. ", 
                          "Designed to be modular so that you can use together or in isolation. ",
                          "Encourage you to use [Minimal Reproducible Examples (reprex)](https://stackoverflow.com/help/minimal-reproducible-example) both to help solve issues yourself and when asking questions of colleagues or on stackoverflow.\n\n",
                          "updated ", Sys.Date(), "\n\n",
                          "To use, either :\n",
                          "1. create a new [RStudio project from the repository](https://github.com/uclh-criu/learning-datascience/blob/master/instructions/03-instructions-if-self-guided.md#1-download-the-course-materials-from-github-into-an-rstudio-project) to view & run the scripts locally \n",
                          "2. just copy & paste the code from Github into RStudio\n\n",
                          "These examples are in early development and are likely to change, please suggest or submit improvements.\n\n",
                          "(note to authors : this file is created by x-create-readme.r)\n")

# go through each file & create an entry in the readme from the filename
# and the 2nd line of the file

for (i in filenames) {
  
  # cat(i)
  
  # first_lines <- read_lines(paste0('examples-mini/',i), skip_empty_rows=TRUE, n_max=2)
  # text_for_readme <- c(text_for_readme,'\n',first_lines)
  
  #use the filename and add ## to make it a markdown heading
  #line1 <- paste0("## ",i,"\n")
  
  #try creating link to Github location
  line1 <- paste0("## [",i,"](https://github.com/uclh-criu/learning-datascience/blob/master/examples-mini/",i,")\n")
  
  #extract the 2nd line description from the file  
  line2 <- read_lines(paste0('examples-mini/',i), skip_empty_rows=TRUE, n_max=1, skip=1)
  #remove # comment marks in R that influence markdown formatting
  line2 <- str_remove_all(line2,"#")
  
  # add the entry for this file to that from earlier files
  text_for_readme <- c(text_for_readme,'\n', line1, line2)  
  
}

# write all lines to a markdown file (over-writes by default)
write_lines(text_for_readme, 'examples-mini/_readme-examples-mini.md')