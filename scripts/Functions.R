####
####
## Script name: FUNCTIONS
## Objective: Tidy and transpose water analysis report
## Author: Micheline Campbell
## Date begun: 20200513
## Last edited: 20200513
##  By: MC
## Email: michelineleecampbell@gmail.com
## Other contributors: 
####
####

##
## Notes
##

# This function tidies and transposes Water Analysis Report data

tidyreports <- function(datx, export_name){
  
  # require(tidyverse)
  # require(janitor)
  
  dat1 <- datx %>% 
    remove_empty(c("rows", "cols")) %>% # removes empty rows and cols
    mutate_all(funs(gsub("[\U4E00-\U9FFF\U3000-\U303F\U3400-\U4DBF]", "",.))) %>%  ## gets rid of random Chinese characters
    mutate_all(funs(gsub("\\s+", "",.))) # removes empty sapces for whole sheet
  # has_rownames(dat1)
  
  dat1 <- dat1[which(dat1 == "SampleNo", arr.ind=TRUE)[1]:dim(dat1[1]),] # resample for rows with Sample number and beyong
  
  dat1 <-dat1[,-1]
  
  dat2 <- as.matrix(dat1) ## necessary step because otherwise t() converts everything to factor...
  
  dat2 <- as_tibble(t(dat2)) ## keping it a tibble, not a dataframe helped with the factor problem toooo
  
  startna <- which(is.na(dat2[1,])) ## there are some values in row 2 that we want as col names. Get these values into row 1 (with our other future colnames)
  dat2[1,startna] <- dat2[2,startna]
  
  colnames(dat2) <- unlist(dat2[1,]) #rename columns with colnames we want
  dat2 <- dat2[-c(1,2),] # remove row two, since these are now the column names! Removes row 1 because we don't need it
  
  # View(dat2) ##looks goooood!
  
  dat3 <- dat2 %>% 
    remove_empty(c("rows", "cols")) %>% 
    clean_names() 
  
  # View(dat3)
  write.csv(dat3, export_name, col.names = TRUE)

  
}

