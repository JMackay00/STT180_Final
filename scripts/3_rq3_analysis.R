source("program/rq3_models.R")
source("program/rq3_plots.R")

# 1. Load cleaned data
data <- readRDS("data_clean/SpeedDatingClean.rds")

# 2. Fit models
male_model   <- fit_rq3_male_model(data)
female_model <- fit_rq3_female_model(data)

# 3. Create plots
# Histograms
p_hist_male   <- plot_rq3_hist_like_male(data)
p_hist_female <- plot_rq3_hist_like_female(data)

# Residuals vs fitted
p_resid_fit_male   <- plot_rq3_resid_vs_fitted_male(male_model)
p_resid_fit_female <- plot_rq3_resid_vs_fitted_female(female_model)

# QQ plots
p_qq_male   <- plot_rq3_qq_resid_male(male_model)
p_qq_female <- plot_rq3_qq_resid_female(female_model)

# 5. Save plots
ggsave("figures/rq3/rq3_hist_like_male.png", p_hist_male, width = 6, height = 4)
ggsave("figures/rq3/rq3_hist_like_female.png", p_hist_female, width = 6, height = 4)
ggsave("figures/rq3/rq3_resid_fitted_male.png", p_resid_fit_male, width = 6, height = 4)
ggsave("figures/rq3/rq3_resid_fitted_female.png", p_resid_fit_female, width = 6, height = 4)
ggsave("figures/rq3/rq3_qq_resid_male.png", p_qq_male, width = 5, height = 5)
ggsave("figures/rq3/rq3_qq_resid_female.png", p_qq_female, width = 5, height = 5)
