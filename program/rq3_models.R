library(tidyverse)

# Prepare male data
prepare_rq3_male_data <- function(data) {
  data %>%
    select(LikeM, FunM, SincereM, AmbitiousM, IntelligentM) %>%
    drop_na()
}

# Prepare female data
prepare_rq3_female_data <- function(data) {
  data %>%
    select(LikeF, FunF, SincereF, AmbitiousF, IntelligentF) %>%
    drop_na()
}

# Men rating women
fit_rq3_male_model <- function(data) {
  data_rq3_m <- prepare_rq3_male_data(data)
  
  lm(
    LikeM ~ FunM + SincereM + AmbitiousM + IntelligentM,
    data = data_rq3_m
  )
}

# Women rating men 
fit_rq3_female_model <- function(data) {
  data_rq3_f <- prepare_rq3_female_data(data)
  
  lm(
    LikeF ~ FunF + SincereF + AmbitiousF + IntelligentF,
    data = data_rq3_f
  )
}
