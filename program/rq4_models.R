library(tidyverse)

# 1. Add RQ4 variables
add_rq4_variables <- function(data) {
  data %>%
    mutate(
      MutualMatch = if_else(DecisionM == 1 & DecisionF == 1, 1L, 0L),
      MissedConnection = case_when( 
        LikeM >= 7 & LikeF >= 7 & MutualMatch == 0L ~ 1L,
        LikeM >= 7 & LikeF >= 7 & MutualMatch == 1L ~ 0L,
        TRUE ~ NA_integer_
      ),
      UnderestimateM = LikeF - PartnerYesM,
      UnderestimateF = LikeM - PartnerYesF,
      HypDecisionM = if_else(LikeM >= 7, 1L, 0L),
      HypDecisionF = if_else(LikeF >= 7, 1L, 0L),
      HypMatch = if_else(HypDecisionM == 1L & HypDecisionF == 1L, 1L, 0L)
    )
}

# 2. Filter to match_worthy pairs
get_matchworthy_data <- function(data_rq4) {
  data_rq4 %>%
    filter(!is.na(MissedConnection))
}

# 3. Summary of match-worthy pairs
summarize_matchworthy <- function(mc_data) {
  mc_data %>%
    summarise(
      n_matchworthy = n(),
      n_missed = sum(MissedConnection == 1L),
      n_actual_matches = sum(MissedConnection == 0L),
      prop_missed = n_missed / n_matchworthy
    )
}

# 4. T-tests for PartnerYes
run_partner_yes_ttests <- function(mc_data) {
  list(
    male = t.test(PartnerYesM ~ MissedConnection, data = mc_data),
    female = t.test(PartnerYesF ~ MissedConnection, data = mc_data)
  )
}

# 5. Logistic regression for missed connections
fit_missed_logit <- function(mc_data) {
  glm(
    MissedConnection ~ UnderestimateM + UnderestimateF,
    data = mc_data,
    family = binomial()
  )
}

# 6. Perfect-information world summary
summarize_perfect_info <- function(data_rq4) {
  data_rq4 %>%
    summarise(
      actual_matches = sum(MutualMatch == 1L, na.rm = TRUE),
      hypothetical_matches = sum(HypMatch == 1L, na.rm = TRUE),
      extra_matches = hypothetical_matches - actual_matches
    )
}