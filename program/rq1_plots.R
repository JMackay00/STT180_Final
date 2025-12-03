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