library(tidyverse)

# Prepare data for male model
prepare_rq1_male_data <- function(data) {
  data %>%
    select(LikeM, SharedInterestsM, SincereM) %>%
    drop_na()
}

# Prepare data for female model
prepare_rq1_female_data <- function(data) {
  data %>%
    select(LikeF, SharedInterestsF, SincereF) %>%
    drop_na()
}

# 1. Men rating women
fit_rq1_male_model <- function(data) {
  data_rq1_m <- prepare_rq1_male_data(data)
  
  lm(LikeM ~ SharedInterestsM * SincereM, data = data_rq1_m)
}

# 2. Women rating men
fit_rq1_female_model <- function(data) {
  data_rq1_f <- prepare_rq1_female_data(data)
  
  lm(LikeF ~ SharedInterestsF * SincereF, data = data_rq1_f)
}