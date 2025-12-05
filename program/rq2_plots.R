library(tidyverse)

# 1. Predictor histograms
plot_rq2_hist_predictors_male <- function(data) {
  data_rq2_m <- data %>%
    select(AttractiveM, IntelligentM, FunM) %>%
    pivot_longer(everything(), names_to = "trait", values_to = "score")
  
  ggplot(data_rq2_m, aes(x = score)) +
    geom_histogram(binwidth = 1, color = "black", fill = "skyblue") +
    facet_wrap(~ trait, scales = "free_x") +
    labs(
      title = "RQ2: Distribution of Male Ratings (AttractiveM, IntelligentM, FunM)",
      x     = "Score",
      y     = "Count"
    ) +
    theme_minimal()
}

plot_rq2_hist_predictors_female <- function(data) {
  data_rq2_f <- data %>%
    select(AttractiveF, IntelligentF, FunF) %>%
    pivot_longer(everything(), names_to = "trait", values_to = "score")
  
  ggplot(data_rq2_f, aes(x = score)) +
    geom_histogram(binwidth = 1, color = "black", fill = "pink") +
    facet_wrap(~ trait, scales = "free_x") +
    labs(
      title = "RQ2: Distribution of Female Ratings (AttractiveF, IntelligentF, FunF)",
      x     = "Score",
      y     = "Count"
    ) +
    theme_minimal()
}

# 2. Fitted probability vs predictor
plot_rq2_fitted_vs_attractiveness_male <- function(model, data) {
  df <- data %>%
    select(DecisionM, AttractiveM) %>%
    drop_na() %>%
    mutate(
      fitted = fitted(model)
    )
  
  ggplot(df, aes(x = AttractiveM, y = fitted)) +
    geom_point(alpha = 0.4) +
    geom_smooth(method = "loess", se = FALSE) +
    labs(
      title = "RQ2: Male Model - Prob. of Saying Yes vs AttractiveM",
      x     = "AttractiveM",
      y     = "Predicted Probability of Saying 'Yes'"
    ) +
    theme_minimal()
}

plot_rq2_fitted_vs_attractiveness_female <- function(model, data) {
  df <- data %>%
    select(DecisionF, AttractiveF) %>%
    drop_na() %>%
    mutate(
      fitted = fitted(model)
    )
  
  ggplot(df, aes(x = AttractiveF, y = fitted)) +
    geom_point(alpha = 0.4) +
    geom_smooth(method = "loess", se = FALSE) +
    labs(
      title = "RQ2: Female Model - Prob. of Saying Yes vs AttractiveF",
      x     = "AttractiveF",
      y     = "Predicted Probability of Saying 'Yes'"
    ) +
    theme_minimal()
}

# 3. Residuals vs fitted
plot_rq2_resid_vs_fitted_male <- function(model) {
  df <- data.frame(
    fitted = fitted(model),
    resid  = residuals(model, type = "deviance")
  )
  
  ggplot(df, aes(x = fitted, y = resid)) +
    geom_point(alpha = 0.4) +
    geom_hline(yintercept = 0, linetype = "dashed") +
    labs(
      title = "RQ2: Male Logistic Model - Residuals vs Fitted",
      x     = "Fitted Probability",
      y     = "Deviance Residuals"
    ) +
    theme_minimal()
}

plot_rq2_resid_vs_fitted_female <- function(model) {
  df <- data.frame(
    fitted = fitted(model),
    resid  = residuals(model, type = "deviance")
  )
  
  ggplot(df, aes(x = fitted, y = resid)) +
    geom_point(alpha = 0.4) +
    geom_hline(yintercept = 0, linetype = "dashed") +
    labs(
      title = "RQ2: Female Logistic Model - Residuals vs Fitted",
      x     = "Fitted Probability",
      y     = "Deviance Residuals"
    ) +
    theme_minimal()
}