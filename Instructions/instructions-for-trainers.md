## Instructions for Trainers

### For August 2021 course

Online in MS Teams.


#### Trainer Roles

Content delivery [Andy South] deliver content to the main room.
Meeting organiser & learner support [Mei Bai] monitor learner responses, manage breakout rooms, chip in.
Learner support [Steve Harris & Deborah Douglas] support individual learners in breakout rooms as required, feedback & chip in.


#### MS Teams details

Main room for content delivery - 2 breakout rooms for troubleshooting.

Meeting organiser [Mei] can upgrade others initially to an 'attendee' and then to 'presenter'.

Meeting organiser [Mei] can create the breakout rooms & allocate people to them. If a learner has a problem, Mei can allocate them to a breakout room & one of the other trainers to go in too. Rooms are initially closed and those allocated are not moved until the room is opened by the organiser. Those moved will be given a 10s warning.

In a breakout room learners can share their screen, a trainer can ask to 'Take control' and can potentially e.g. type into R console on the learners machine.

Both learner & trainer can press leave to exit breakout room & return to main room - may need to press 'Resume'.

The chat in Teams can be used for communication. We will also use an [online collaborative document](https://nhs-my.sharepoint.com/:w:/r/personal/mei_bai_nhs_net/_layouts/15/guestaccess.aspx?e=TIhNZt&share=ERBkMbqA6QVAo6DOtqNxVfQBBBwvGvroM5yO3e_3Vy_Xtg). (In sharepoint because a googledoc was less easy for contribution from NHS email addresses).





## General tips.
- Note that powerpoint slides have speaker notes switch to 'presenter view' to see.


[todo OLD below, do we need it]
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
