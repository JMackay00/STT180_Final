library(ggplot2)

# 1. Histograms 
plot_rq3_hist_like_male <- function(data) {
  ggplot(data, aes(x = LikeM)) +
    geom_histogram(binwidth = 1, color = "black", fill = "skyblue") +
    labs(
      title = "Male Romantic Liking (LikeM)",
      x     = "LikeM",
      y     = "Count"
    ) +
    theme_minimal()
}

plot_rq3_hist_like_female <- function(data) {
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
plot_rq3_resid_vs_fitted_male <- function(model) {
  df <- data.frame(
    fitted = fitted(model),
    resid  = resid(model)
  )
  
  ggplot(df, aes(x = fitted, y = resid)) +
    geom_point(alpha = 0.5) +
    geom_hline(yintercept = 0, linetype = "dashed") +
    labs(
      title = "RQ3 Male Model: Residuals vs Fitted Values",
      x     = "Fitted Values",
      y     = "Residuals"
    ) +
    theme_minimal()
}

plot_rq3_resid_vs_fitted_female <- function(model) {
  df <- data.frame(
    fitted = fitted(model),
    resid  = resid(model)
  )
  
  ggplot(df, aes(x = fitted, y = resid)) +
    geom_point(alpha = 0.5) +
    geom_hline(yintercept = 0, linetype = "dashed") +
    labs(
      title = "RQ3 Female Model: Residuals vs Fitted Values",
      x     = "Fitted Values",
      y     = "Residuals"
    ) +
    theme_minimal()
}

# 3. QQ plots
plot_rq3_qq_resid_male <- function(model) {
  df <- data.frame(resid = resid(model))
  
  ggplot(df, aes(sample = resid)) +
    stat_qq() +
    stat_qq_line() +
    labs(
      title = "RQ3 Male Model: QQ Plot of Residuals",
      x     = "Theoretical Quantiles",
      y     = "Sample Quantiles"
    ) +
    theme_minimal()
}

plot_rq3_qq_resid_female <- function(model) {
  df <- data.frame(resid = resid(model))
  
  ggplot(df, aes(sample = resid)) +
    stat_qq() +
    stat_qq_line() +
    labs(
      title = "RQ3 Female Model: QQ Plot of Residuals",
      x     = "Theoretical Quantiles",
      y     = "Sample Quantiles"
    ) +
    theme_minimal()
}

# 4. Scatterplots
plot_rq3_scatter_fun_male <- function(data) {
  ggplot(data, aes(x = FunM, y = LikeM)) +
    geom_point(alpha = 0.4, color = "skyblue") +
    geom_smooth(method = "lm", se = FALSE, color = "darkblue") +
    labs(
      title = "Male: Liking vs Fun Rating",
      x     = "Fun Rating (FunM)",
      y     = "Liking (LikeM)"
    ) +
    theme_minimal()
}

plot_rq3_scatter_fun_female <- function(data) {
  ggplot(data, aes(x = FunF, y = LikeF)) +
    geom_point(alpha = 0.4, color = "pink") +
    geom_smooth(method = "lm", se = FALSE, color = "red") +
    labs(
      title = "Female: Liking vs Fun Rating",
      x     = "Fun Rating (FunF)",
      y     = "Liking (LikeF)"
    ) +
    theme_minimal()
}
