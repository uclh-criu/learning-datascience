## Instructions for Trainers



### Structure of the Course


- You will be supporting candidates on an individual basis with their queries as they work through problems
- For each workshop there will be 3 Facilitators
    - 1 Lead Facilitator, who will also be co-ordinating and presenting that workshop contents
    - 2 Assitant Facilitators
- The Lead Facilitator could be the same person for the 2 days, different on each day or they may alternate on a single day
- You should have been told in advance what your role will be


## General tips.

Note that the all of the powerpoint slides have speaker notes embedded in them. Instructors will be able to view these if they change their powerpoint view to 'presenter view' while speaking.


### Tips on individual workshops.

#### The welcome slides.

The instructor needs to make sure that each candidate has met the prerequisites. Feel free to pause and help candidates out.

A note on the datasets for workshop7. Candidates can either bring their own data, and work with it in R, or they can use the synthetic CCHIC dataset. 

At the end of this, upload the pdf document of the handout to the slack channel so that candidates can access it throughout the course. 


#### Workshop 1. 

Just consists of the slides. 

#### Workshop 2.

This does not include slides. Candidates navigate to the 'Workshop 2' section of the handout, read it and follow the instructions there. 

The workshop aims to demonstrate the principles of tidy data. 

A 'dirty' version of the cchic dataset is provided, as well as a clean one. 

Instructors should upload the file called `dirty_CCHIC.xlsx` to Slack, get the candidates to download it, open it in their spreadsheet application, and apply the principles described in the handout to clean it up. 

It may be helpful for instructors to split the candidates into small groups of 3-5 people each, and get each group to fix a particular problem with the csv file. The groups then discuss the changes they made.

#### Workshop 3.

Just the slides. 
Share the file called `clean_CCHIC.csv` on Slack. Aim to read in the csv file and have a dataframe called `cchic` in each candidates R environment by the time the workshop is over. 

#### Workshop 4.

This includes both the slides and an additional R script. The instructor presents the slides, and the candidates can follow along using the R script. Alternatively, they can type as they go along. 

Remind the candidates that they will need the variables created in this session on the next day. This means that their `cchic` dataframe needs to contain a `los` variable. 

#### Workshop 5.

Remind candidates to load the same R object they created the day before. This cchic object should include the `los` variable. Allow a bit of time to make sure everyone has the dataset in their environment before demonstrating `ggplot` functions. 

The workshop includes both the slides and the R script. At one point in the slides, candidates will be asked to open up the R script, and work through those examples. The R script should help them get a better idea of how small changes in the code can build on the same base graph. 

#### Workshop 6.

Just consists of the slides.

#### Workshop 7.

Includes an R script which is just a template for working in R and analysing data generally. Upload to the slack channel at the beginning, and let candidates look through it in thier own time.

Allow candidates to work with their own data. Just go around providing assistance as required. If candidates have not brought in their own data, give them the opportunity to answer questions they may be interested in using the synthetic CCHIC dataset. 


Thank you, and good luck!
