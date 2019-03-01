#' Code to simulate a large brand consumption dataset
#' 5000 rows x 153 variables

library(tidyverse)

q2_gender <- sample(x = c("Male","Female","Other"),
                    size = 5000,
                    prob = c(.48,.51,.01),
                    replace = TRUE)

q3_age <- rpois(n = 5000, lambda = 50)

#' Simulated Brand Consumption, 150 columns x 5000 rows
matrix(data = sample(x = c(0,1),150 * 5000, replace = TRUE),
       nrow = 5000,
       ncol = 150) %>%
  as.data.frame() -> brand_con_sim 

#' Generate 150 column names to the simulated brand consumption data
paste0("Q",LETTERS[1:15],"_") %>%
  sapply(function(x) paste0(x,1:10)) %>%
  as.character() -> names(brand_con_sim)
 
  
#' Simulate ID, Gender, and Age variables
#' Use cbind() to combine with the simulated brand consumption data
tibble(ID = 1:5000,
       Q2_GENDER = q2_gender,
       Q3_AGE = q3_age) %>%
  cbind(brand_con_sim) -> big_snack_data


#' Uncomment and run to export
# big_snack_data %>%
#   readr::write_csv("Big Snack Data.csv")
