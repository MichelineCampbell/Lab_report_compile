####
####
## Script name: Combine_reports
## Objective: Combine tidied and transposed water analysis reports
## Author: Micheline Campbell
## Date begun: 20200513
## Last edited: 20200514
##  By: MC
## Email: michelineleecampbell@gmail.com
## Other contributors: S. Donaldson
####
####

## RUN THESE COMMANDS
.rs.restartR() # reloads R session
library(tidyverse)

## READ YOUR TIDIED AND TRANSPOSED DATA IN  - replace 'tidydat1' with the name of the tidied and transposed data that you exported with Transpose_reports. Note that these data aren't in the 'data' folder, they should be in the directory with the report_processing.Rproj file. As before, add extra lines as needed or comment out unneeded arguments.

dat1 <- read_csv("tidydata1.csv", col_types = cols(.default = "c"))
dat2 <- read_csv("tidydata2.csv", col_types = cols(.default = "c"))
dat3 <- read_csv("tidydata3.csv", col_types = cols(.default = "c"))
# dat4 <- read_csv("tidydata4.csv", col_types = cols(.default = "c"))

## Combine separate datasets. If you need to add extra rows, add them BEFORE the print() function - that is just a fail safe to avoid breaking the loop.  
datx <- dat1 %>% 
  full_join(dat2) %>% 
  full_join(dat3) %>% 
  # full_join(dat4) %>% 
  print()

View(datx) # inspect data, hopefully it looks OK!


## Export tidied, transposed, joined data - replace 'tidydatacombined.csv' with your preferred file name. Note that this will save the .csv to the folder which holds this .rproj file. 
write.csv(datx, "tidydatacombined.csv")
