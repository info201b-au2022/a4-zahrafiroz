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
#values;
female_jail_pop <- 
  incarceration_df  %>%
  summarise(x = sum(female_jail_pop, na.rm = TRUE))

male_jail_pop <-
  incarceration_df  %>%
  summarise(x = sum(male_jail_pop, na.rm = TRUE))

black_jail_pop <- incarceration_df$black_prison_pop
white_jail_pop <- incarceration_df$white_jail_pop
native_jail_pop <- incarceration_df$native_jail_pop
latinx_jail_pop <- incarceration_df$latinx_jail_pop


get_jail_pop_by_states <- function() {
  p <- incarceration_df %>%
    group_by(state) %>%
    summarise(x = sum(total_jail_pop, na.rm = TRUE)) %>%
    select(total_pop) %>%
    pull(total_pop)
  return(p)
}
states <- (incarceration_df$state)
%>% group_by(state)

get_jail_pop_by_states(states)
}
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

# Function to make chart to by state showing region and population
} 
plot_jail_pop_for_us <-
  incarceration_df %>%
  group_by(state) %>%
  select(state, total_pop, region)

  ggplot(plot_jail_pop)+
  geom_col(
    mapping = aes(x = total_pop, y = state, fill = region),
    position = "dodge"
  )
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
ggplot(data = incarceration_df)
#----------------------------------------------------------------------------#

## Load data frame ---- 


