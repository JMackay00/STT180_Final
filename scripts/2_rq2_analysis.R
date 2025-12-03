source("program/rq2_models.R")
source("program/rq2_plots.R")

# 1. Load cleaned data
data <- readRDS("data_clean/SpeedDatingClean.rds")

# 2. Fit models
male_logit   <- fit_rq2_male_logit(data)
female_logit <- fit_rq2_female_logit(data)

# 3. Create plots
# Histograms
p_hist_pred_male   <- plot_rq2_hist_predictors_male(data)
p_hist_pred_female <- plot_rq2_hist_predictors_female(data)

# Fitted vs Attractiveness
p_fit_attr_male   <- plot_rq2_fitted_vs_attractiveness_male(male_logit, data)
p_fit_attr_female <- plot_rq2_fitted_vs_attractiveness_female(female_logit, data)

# Residuals vs Fitted 
p_resid_fit_male   <- plot_rq2_resid_vs_fitted_male(male_logit)
p_resid_fit_female <- plot_rq2_resid_vs_fitted_female(female_logit)

# 4. Save plots
ggsave("figures/rq2/rq2_hist_predictors_male.png", p_hist_pred_male, width = 6, height = 4)
ggsave("figures/rq2/rq2_hist_predictors_female.png", p_hist_pred_female, width = 6, height = 4)
ggsave("figures/rq2/rq2_fit_vs_attractive_male.png", p_fit_attr_male, width = 6, height = 4)
ggsave("figures/rq2/rq2_fit_vs_attractive_female.png", p_fit_attr_female, width = 6, height = 4)
ggsave("figures/rq2/rq2_resid_fitted_male.png", p_resid_fit_male, width = 6, height = 4)
ggsave("figures/rq2/rq2_resid_fitted_female.png", p_resid_fit_female, width = 6, height = 4)