source("program/rq4_models.R")
source("program/rq4_plots.R")

# 1. Load and prepare data
data <- readRDS("data_clean/SpeedDatingClean.rds")
data_rq4 <- add_rq4_variables(data)
mc_data  <- get_matchworthy_data(data_rq4)

# 2. Summaries
mc_summary    <- summarize_matchworthy(mc_data)
ttest_results <- run_partner_yes_ttests(mc_data)
missed_logit  <- fit_missed_logit(mc_data)
perfect_info  <- summarize_perfect_info(data_rq4)

# 3. Plots
# Histograms
p_hist_male   <- plot_partner_yes_hist_male(mc_data)
p_hist_female <- plot_partner_yes_hist_female(mc_data)

# Boxplots
p_box_male    <- plot_partner_yes_box_male(mc_data)
p_box_female  <- plot_partner_yes_box_female(mc_data)

# QQ plots
p_qq_male_match    <- plot_rq4_qq_male_match(mc_data)
p_qq_male_missed   <- plot_rq4_qq_male_missed(mc_data)
p_qq_female_match  <- plot_rq4_qq_female_match(mc_data)
p_qq_female_missed <- plot_rq4_qq_female_missed(mc_data)

# 4. Save plots
ggsave("figures/rq4/rq4_hist_male.png", p_hist_male, width = 6, height = 4)
ggsave("figures/rq4/rq4_hist_female.png", p_hist_female, width = 6, height = 4)
ggsave("figures/rq4/rq4_box_male.png", p_box_male, width = 6, height = 4)
ggsave("figures/rq4/rq4_box_female.png", p_box_female, width = 6, height = 4)
ggsave("figures/rq4/rq4_qq_male_match.png", p_qq_male_match, width = 5, height = 5)
ggsave("figures/rq4/rq4_qq_male_missed.png", p_qq_male_missed, width = 5, height = 5)
ggsave("figures/rq4/rq4_qq_female_match.png", p_qq_female_match, width = 5, height = 5)
ggsave("figures/rq4/rq4_qq_female_missed.png", p_qq_female_missed, width = 5, height = 5)