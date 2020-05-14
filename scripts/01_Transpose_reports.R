####
####
## Script name: Transpose_reports
## Objective: Use the tidyreports function to transpose water analysis reports
## Author: Micheline Campbell
## Date begun: 20200513
## Last edited: 20200514
##  By: MC
## Email: michelineleecampbell@gmail.com
## Other contributors: S. Donaldson
####
####

## RUN THESE COMMANDS:
.rs.restartR()
source("scripts/Functions.R")
library(tidyverse)
library(janitor)

## READ YOUR DATA IN  - replace 'yourdata1' with the name of your file. If you have more or less than 4 just copy rows as dat5, dat6, etc. or comment out unneeded rows - see dat4 below for e.g.

dat1 <- read_csv("data/yourdata1.csv", col_types = cols(.default = "c"))
dat2 <- read_csv("data/yourdata2.csv", col_types = cols(.default = "c"))
dat3 <- read_csv("data/yourdata3.csv", col_types = cols(.default = "c"))
# dat4 <- read_csv("data/yourdata4.csv", col_types = cols(.default = "c"))


## Transpose your data! replace 'tidydata1' with the name you want for your tidied transposed data 
  ## this will automatically save .csv of separate tidied and transposed lab reports to the head folder of this project 
  ## as above, add extra rows or comment out unneeded rows. 
tidyreports(dat1, "tidydata1.csv")
tidyreports(dat2, "tidydata2.csv")
tidyreports(dat3, "tidydata3.csv")
# tidyreports(dat4, "tidydata4.csv")
