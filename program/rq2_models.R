library(tidyverse)

# Prepare data for male logistic model
prepare_rq2_male_data <- function(data) {
  data %>%
    select(DecisionM, AttractiveM, IntelligentM, FunM) %>%
    drop_na()
}

# Prepare data for female logistic model
prepare_rq2_female_data <- function(data) {
  data %>%
    select(DecisionF, AttractiveF, IntelligentF, FunF) %>%
    drop_na()
}

# Men deciding on women
fit_rq2_male_logit <- function(data) {
  data_rq2_m <- prepare_rq2_male_data(data)
  
  glm(
    DecisionM ~ AttractiveM + IntelligentM + FunM,
    data = data_rq2_m,
    family = binomial()
  )
}

# Women deciding on men
fit_rq2_female_logit <- function(data) {
  data_rq2_f <- prepare_rq2_female_data(data)
  
  glm(
    DecisionF ~ AttractiveF + IntelligentF + FunF,
    data = data_rq2_f,
    family = binomial()
  )
}