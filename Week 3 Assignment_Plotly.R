# Week 3 Assignment: Plotly -----------------------------------------------
library(RCurl)
library(tidyverse)
library(plotly)
grads <- read.csv(text = getURL("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018-10-16/recent-grads.csv"), header = TRUE)
str(grads)
# We do not want a variable to have 173 factor levels so we will conver the Major variable into a character variable.
grads$Major <- as.character(grads$Major)

# Check for missing data by counting the number of NAs in the data
sapply(grads, function(x) sum(is.na(x)))

y <- list(title = "")
x <- list(title = "Source: American Community Survey 2010-2012 Public Use Microdata Series", size = 8)

grads %>% 
        select(Major_category, Total, Median, P25th, P75th) %>% 
        arrange(Median) %>% 
        plot_ly(x = ~Median, color = ~Major_category, type = "box") %>% 
        layout(xaxis = x, showlegend = FALSE, 
               title = "18 Oct 2018: Median Earnings by Major Category (Dollars)") 



