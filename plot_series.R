library(tidyr)
library(dplyr)
library(fpp3)
library(tsibble)

# measure is the numbers 
# index is when that measure was recordered 
# we can se tthe index outselves to any column! 

tibble(month = c('2019 Jan', 
                 '2019 Feb',
                 '2019 Mar',
                 '2019 Apr',
                 '2019 May'), 
       observation = 1:5) %>% 
mutate(Month = yearmonth(month)) %>% 
  as_tsibble(index = Month)

# the time plot a quick check into how it's looking: 
# observations plotting against the time of the observation with consecutive obvs joined by straight lintres! 

# tsibble allows multiple time series to be stored in a single object - dataframe 
# key structure tells you how many seperate time series there are in the tibble! 

olympic_running %>% 
distinct(Sex)

# here there are 14 different keys = 14 difrferent time series found within the data, the index is till 1M so 1 month! 

ansett %>% 
  filter(Airports == "MEL-SYD", Class == "Economy") %>%  
  mutate(Passengers = Passengers/1000) %>% 
  autoplot(., Passengers) + 
  labs(title = "Ecopnomy class", 
       subtitle = "MEL to SYD", 
       y = "Passengers (in 1000's)")

# time series plot of medicine! 
a10 <- PBS %>%
  filter(ATC2 == "A10") %>%
  select(Month, Concession, Type, Cost) %>%
  summarise(TotalC = sum(Cost)) %>%
  mutate(Cost = TotalC / 1e6) 

a10
# no keys set, but index is 1 month! 

autoplot(a10, Cost)

# season plot - like a timeplot but over the individual seasons - basically the individual indexs really that make the time series up! 
a10 %>% 
  gg_season(Cost, labels = "both")

# e.g. march 2008 has values that decreased which is not usual! 
vic_elec %>% 
  gg_season(Demand, labels = "both", period = "month")


# seasonal subseries plots
