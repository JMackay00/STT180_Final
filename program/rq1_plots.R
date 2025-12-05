library(ggplot2)

# 1. Histograms
plot_rq1_hist_like_male <- function(data) {
  ggplot(data, aes(x = LikeM)) +
    geom_histogram(binwidth = 1, color = "black", fill = "skyblue") +
    labs(
      title = "Male Romantic Liking (LikeM)",
      x     = "LikeM",
      y     = "Count"
    ) +
    theme_minimal()
}

plot_rq1_hist_like_female <- function(data) {
  ggplot(data, aes(x = LikeF)) +
    geom_histogram(binwidth = 1, color = "black", fill = "pink") +
    labs(
      title = "Female Romantic Liking (LikeF)",
      x     = "LikeF",
      y     = "Count"
    ) +
    theme_minimal()
}

# 2. Residuals vs Fitted
plot_rq1_resid_vs_fitted_male <- function(model) {
  df <- data.frame(
    fitted = fitted(model),
    resid  = residuals(model)
  )
  
  ggplot(df, aes(x = fitted, y = resid)) +
    geom_point(alpha = 0.5) +
    geom_hline(yintercept = 0, linetype = "dashed") +
    labs(
      title = "RQ1 Male Model: Residuals vs Fitted",
      x     = "Fitted values",
      y     = "Residuals"
    ) +
    theme_minimal()
}

plot_rq1_resid_vs_fitted_female <- function(model) {
  df <- data.frame(
    fitted = fitted(model),
    resid  = residuals(model)
  )
  
  ggplot(df, aes(x = fitted, y = resid)) +
    geom_point(alpha = 0.5) +
    geom_hline(yintercept = 0, linetype = "dashed") +
    labs(
      title = "RQ1 Female Model: Residuals vs Fitted",
      x     = "Fitted values",
      y     = "Residuals"
    ) +
    theme_minimal()
}

# 3. QQ plots of residuals
plot_rq1_qq_resid_male <- function(model) {
  df <- data.frame(resid = residuals(model))
  
  ggplot(df, aes(sample = resid)) +
    stat_qq() +
    stat_qq_line() +
    labs(
      title = "RQ1 Male Model: QQ Plot of Residuals",
      x     = "Theoretical Quantiles",
      y     = "Sample Quantiles"
    ) +
    theme_minimal()
}

plot_rq1_qq_resid_female <- function(model) {
  df <- data.frame(resid = residuals(model))
  
  ggplot(df, aes(sample = resid)) +
    stat_qq() +
    stat_qq_line() +
    labs(
      title = "RQ1 Female Model: QQ Plot of Residuals",
      x     = "Theoretical Quantiles",
      y     = "Sample Quantiles"
    ) +
    theme_minimal()
}

# 4. Interaction plots
plot_rq1_interaction_male <- function(data) {
  
  data <- data %>%
    mutate(
      SincereGroup = case_when(
        SincereM <= quantile(SincereM, 0.33) ~ "Low Sincerity",
        SincereM <= quantile(SincereM, 0.66) ~ "Medium Sincerity",
        TRUE ~ "High Sincerity"
      )
    )
  
  ggplot(data, aes(x = SharedInterestsM, y = LikeM, color = SincereGroup)) +
    geom_point(alpha = 0.4) +
    geom_smooth(method = "lm", se = FALSE) +
    labs(
      title = "Interaction: Shared Interests × Sincerity (Male Model)",
      x     = "Shared Interests (M)",
      y     = "Liking Score (LikeM)",
      color = "Sincerity Level"
    ) +
    theme_minimal()
}

plot_rq1_interaction_female <- function(data) {
  
  data <- data %>%
    mutate(
      SincereGroup = case_when(
        SincereF <= quantile(SincereM, 0.33) ~ "Low Sincerity",
        SincereF <= quantile(SincereM, 0.66) ~ "Medium Sincerity",
        TRUE ~ "High Sincerity"
      )
    )
  
  ggplot(data, aes(x = SharedInterestsF, y = LikeF, color = SincereGroup)) +
    geom_point(alpha = 0.4) +
    geom_smooth(method = "lm", se = FALSE) +
    labs(
      title = "Interaction: Shared Interests × Sincerity (Female Model)",
      x     = "Shared Interests (F)",
      y     = "Liking Score (LikeF)",
      color = "Sincerity Level"
    ) +
    theme_minimal()
}
