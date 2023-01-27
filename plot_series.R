library(tidyr)
library(dplyr)
library(fpp3)
library(tsibble)

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

ansett %>% 
  filter(Airports == "MEL-SYD", Class == "Economy") %>%  
  mutate(Passengers = Passengers/1000) %>% 
  autoplot(., Passengers) + 
  labs(title = "Ecopnomy class", 
       subtitle = "MEL to SYD", 
       y = "Passengers (in 1000's)")
