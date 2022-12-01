library(tidyverse)
library(ggplot2)
library(dplyr)
# The functions might be useful for A4
source("../source/a4-helpers.R")

## Test queries ----
#----------------------------------------------------------------------------#
# Simple queries for basic testing
#----------------------------------------------------------------------------#
# Return a simple string
test_query1 <- function() {
  return ("Hello world")
}

# Return a vector of numbers
test_query2 <- function(num=6) {
  v <- seq(1:num)
  return(v)
}

## Section 2  ---- 
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#

## Section 3  ---- 
#----------------------------------------------------------------------------#
# Growth of the U.S. Prison Population
total_pri_pop <- sum(incarceration_df$total_jail_pop, na.rm = TRUE)
1970_pop <- incarceration_df
#----------------------------------------------------------------------------#

# This function ... <todo:  update comment>
get_year_jail_pop <- function() {
  # TODO: Implement this function 
return()   
}

# This function ... <todo:  update comment>
plot_jail_pop_for_us <- function()  {
  # TODO: Implement this function 
  return()   
} 

## Section 4  ---- 
#----------------------------------------------------------------------------#
# Growth of Prison Population by State 
states <- incarceration_df$state %>%  
group_by(incarceration_df, state)

growth_state_pop <- function() {
  
}
# See Canvas
#----------------------------------------------------------------------------#

## Section 5  ---- 
#----------------------------------------------------------------------------#
# <variable comparison that reveals potential patterns of inequality>
# Your functions might go here ... <todo:  update comment>

states_with_no_jail_pop <- function() {
  t <- incarceration_df %>%
    group_by(state) %>%
    summarise(p = sum(total_jail_pop, na.rm = TRUE)) %>%
    filter(p == 0) %>%
    select(state, p) %>%
    pull(state)
  return(t)
}

#----------------------------------------------------------------------------#

## Section 6  ---- 
#----------------------------------------------------------------------------#
# <a map shows potential patterns of inequality that vary geographically>
# Your functions might go here ... <todo:  update comment>
# See Canvas
#----------------------------------------------------------------------------#

## Load data frame ---- 


