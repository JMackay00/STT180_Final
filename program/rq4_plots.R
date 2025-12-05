library(ggplot2)

# Labeling 0 and 1
missed_labels <- c("0" = "Match", "1" = "Missed Connection")

# 1. Histograms
plot_partner_yes_hist_male <- function(mc_data) {
  ggplot(mc_data, aes(x = PartnerYesM)) +
    geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
    facet_wrap(
      ~ MissedConnection,
      labeller = labeller(MissedConnection = missed_labels)
    ) +
    labs(
      title    = "Male Perceived Partner Interest (PartnerYesM)",
      subtitle = "Separated by Match Outcome",
      x        = "Male Estimate of Female Interest (PartnerYesM)",
      y        = "Count"
    ) +
    theme_minimal()
}

plot_partner_yes_hist_female <- function(mc_data) {
  ggplot(mc_data, aes(x = PartnerYesF)) + 
    geom_histogram(binwidth = 1, fill = "pink", color = "black") +
    facet_wrap(
      ~ MissedConnection,
      labeller = labeller(MissedConnection = missed_labels)
    ) +
    labs(
      title    = "Female Perceived Partner Interest (PartnerYesF)",
      subtitle = "Separated by Match Outcome",
      x        = "Female Estimate of Male Interest (PartnerYesF)",
      y        = "Count"
    ) +
    theme_minimal()
}

# 2. QQ plots
plot_rq4_qq_male_match <- function(mc_data) {
  df <- data.frame(
    values = mc_data$PartnerYesM[mc_data$MissedConnection == 0]
  )
  
  ggplot(df, aes(sample = values)) +
    stat_qq() +
    stat_qq_line() +
    labs(
      title = "Male PartnerYesM (Match) QQ Plot",
      x     = "Theoretical Quantiles",
      y     = "Sample Quantiles"
    ) +
    theme_minimal()
}

plot_rq4_qq_male_missed <- function(mc_data) {
  df <- data.frame(
    values = mc_data$PartnerYesM[mc_data$MissedConnection == 1]
  )
  
  ggplot(df, aes(sample = values)) +
    stat_qq() +
    stat_qq_line() +
    labs(
      title = "Male PartnerYesM (Missed Connection) QQ Plot",
      x     = "Theoretical Quantiles",
      y     = "Sample Quantiles"
    ) +
    theme_minimal()
}

plot_rq4_qq_female_match <- function(mc_data) {
  df <- data.frame(
    values = mc_data$PartnerYesF[mc_data$MissedConnection == 0]
  )
  
  ggplot(df, aes(sample = values)) +
    stat_qq() +
    stat_qq_line() +
    labs(
      title = "Female PartnerYesF (Match) QQ Plot",
      x     = "Theoretical Quantiles",
      y     = "Sample Quantiles"
    ) +
    theme_minimal()
}

plot_rq4_qq_female_missed <- function(mc_data) {
  df <- data.frame(
    values = mc_data$PartnerYesF[mc_data$MissedConnection == 1]
  )
  
  ggplot(df, aes(sample = values)) +
    stat_qq() +
    stat_qq_line() +
    labs(
      title = "Female PartnerYesF (Missed Connection) QQ Plot",
      x     = "Theoretical Quantiles",
      y     = "Sample Quantiles"
    ) +
    theme_minimal()
}

# 3. Boxplots
plot_partner_yes_box_male <- function(mc_data) {
  ggplot(mc_data, aes(x = factor(MissedConnection),
                      y = PartnerYesM,
                      fill = factor(MissedConnection))) +
    geom_boxplot() +
    labs(
      title = "Male Perception by Match Outcome",
      x     = "Match Outcome (0 = Match, 1 = Missed)",
      y     = "Male Perceived Partner Interest (PartnerYesM)"
    ) +
    theme_minimal()
}

plot_partner_yes_box_female <- function(mc_data) {
  ggplot(mc_data, aes(x = factor(MissedConnection),
                      y = PartnerYesF,
                      fill = factor(MissedConnection))) +
    geom_boxplot() +
    labs(
      title = "Female Perception by Match Outcome",
      x     = "Match Outcome (0 = Match, 1 = Missed)",
      y     = "Female Perceived Partner Interest (PartnerYesF)"
    ) +
    theme_minimal()
}
