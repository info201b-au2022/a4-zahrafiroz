library(tidyverse)
library(ggplot2)
library(dplyr)
library(leaflet)
# The functions might be useful for A4
source("../source/a4-helpers.R")

## Section 2  ---- 
#----------------------------------------------------------------------------#
#values;
#female jail pop
female_jail_pop <- 
  incarceration_df  %>%
  summarise(x = sum(female_jail_pop, na.rm = TRUE))

#male jail pop
male_jail_pop <-
  incarceration_df  %>%
  summarise(x = sum(male_jail_pop, na.rm = TRUE))

#black jail pop
black_jail_pop <- incarceration_df$black_prison_pop

#white jail pop
white_jail_pop <- incarceration_df$white_jail_pop

#native jail pop
native_jail_pop <- incarceration_df$native_jail_pop

#latinx jail pop
latinx_jail_pop <- incarceration_df$latinx_jail_pop

#getting jail pop by state
get_jail_pop_by_states <- function() {
  p <- incarceration_df %>%
    group_by(state) %>%
    summarise(x = sum(total_jail_pop, na.rm = TRUE)) %>%
    select(total_pop) %>%
    pull(total_pop)
  return(p)
}
#check function
AL_jail_pop <- get_jail_pop_by_states(AL)
WY_jail_pop <- get_jail_pop_by_states(WY)


#value states 
states <- (incarceration_df$state)
%>% group_by(state)
#----------------------------------------------------------------------------#

## Section 3  ---- 
#----------------------------------------------------------------------------#
# Growth of the U.S. Prison Population
total_pri_pop <- sum(incarceration_df$total_jail_pop, na.rm = TRUE)
#----------------------------------------------------------------------------#

# This function ... <todo:  update comment>
  get_year_jail_pop <- function(year) {
    year_jail_pop <- filter(incarceration_df,c(year)) %>%
      select(total_pop)
    
   return(year_jail_pop)
  }

# Function to make chart to by state showing region and population
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

  most_pri_in_state <- function(state, total_pop) {
    better_team <- filter(incarceration_df, c(state, total_pop)) %>%
      filter(total_pop == max(total_pop)) %>%
      select(state, total_pop)
    
    most_pri_in_state
  }

  growth_state_pop <- function() {
  }
# See Canvas
#----------------------------------------------------------------------------#

## Section 5  ---- 
#----------------------------------------------------------------------------#
# <variable comparison that reveals potential patterns of inequality>
# Your functions might go here ... <todo:  update comment>
#find most frequent
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
map <- leaflet(incarceration_df)  %>% 
  addTiles() 

map %>% addCircleMarkers(
  lat = ~total_pri_pop,
  lng = ~total_pri_pop,
  popup = ~state,
  stroke = FALSE,
  radius = 1,
  fillOpacity = 0.5
)

#----------------------------------------------------------------------------#

## Load data frame ---- 


