library(tidyverse)

# 1. Load raw data
load("data_raw/SpeedDating.rda")

# Copy Data
dat <- SpeedDating

# 2. Keep only necessary variables
dat_clean <- dat %>%
  select(
    LikeM, LikeF,
    DecisionM, DecisionF,
    PartnerYesM, PartnerYesF,
    AttractiveM, AttractiveF,
    SincereM, SincereF,
    IntelligentM, IntelligentF,
    FunM, FunF,
    AmbitiousM, AmbitiousF,
    SharedInterestsM, SharedInterestsF,
    AgeM, AgeF
  )

# 3. Convert variables to ints
rating_vars <- c(
  "LikeM", "LikeF",
  "PartnerYesM", "PartnerYesF",
  "AttractiveM", "AttractiveF",
  "SincereM", "SincereF",
  "IntelligentM", "IntelligentF",
  "FunM", "FunF",
  "AmbitiousM", "AmbitiousF",
  "SharedInterestsM", "SharedInterestsF"
)

dat_clean <- dat_clean %>%
  mutate(across(all_of(rating_vars), as.integer))

# 4. Drop any missing value rows
dat_clean <- dat_clean %>%
  drop_na()

# 5. Save cleaned data
saveRDS(dat_clean, "data_clean/SpeedDatingClean.rds")