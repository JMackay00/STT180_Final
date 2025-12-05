# STT 180 Final Project: Speed Dating Analysis

## Project Overview

This project analyzes speed dating data to answer four research questions about romantic attraction, decision-making, and missed connections. The analysis uses multiple regression models, logistic regression, and statistical tests.

## Research Questions

**RQ1**: How do Shared Interests and Sincerity interact to predict romantic liking?
- Method: Multiple linear regression with interaction term
- Models: Separate models for men and women

**RQ2**: Does attractiveness predict second-date decisions after controlling for personality?
- Method: Logistic regression
- Predictors: Attractiveness, Intelligence, Fun

**RQ3**: Which personality traits best predict romantic liking?
- Method: Multiple linear regression
- Predictors: Fun, Sincerity, Ambition, Intelligence

**RQ4**: How do misperceptions lead to missed connections?
- Methods: Two-sample t-tests, logistic regression, hypothetical matching analysis
- Focus: Comparing matched vs. missed connections

## How to Run

### Prerequisites
- `tidyverse` package installed (includes `ggplot2`)

### Running the Analysis

1. Set your working directory to the project folder in R:
```r
setwd("path/to/STT180_Final")
```

2. Run the entire project:
```r
source("run_all.R")
```

This will:
- Clean the raw data
- Run all four research question analyses
- Generate all figures

### Running Individual Analyses

If you want to run analyses separately:

```r
# Step 1: Clean data (must run first)
source("scripts/0_clean_data.R")

# Step 2: Run individual research questions
source("scripts/1_rq1_analysis.R")
source("scripts/2_rq2_analysis.R")
source("scripts/3_rq3_analysis.R")
source("scripts/4_rq4_analysis.R")
```

## Project Structure

```
STT180_Final/
├── data_raw/
│   └── SpeedDating.rda          # Original dataset
├── data_clean/
│   └── SpeedDatingClean.rds     # Cleaned data (generated)
├── scripts/                      # Main execution scripts
│   ├── 0_clean_data.R          # Data cleaning
│   ├── 1_rq1_analysis.R        # RQ1 analysis
│   ├── 2_rq2_analysis.R        # RQ2 analysis
│   ├── 3_rq3_analysis.R        # RQ3 analysis
│   └── 4_rq4_analysis.R        # RQ4 analysis
├── program/                      # Function definitions
│   ├── rq1_models.R            # RQ1 model functions
│   ├── rq1_plots.R             # RQ1 plot functions
│   ├── rq2_models.R            # RQ2 model functions
│   ├── rq2_plots.R             # RQ2 plot functions
│   ├── rq3_models.R            # RQ3 model functions
│   ├── rq3_plots.R             # RQ3 plot functions
│   ├── rq4_models.R            # RQ4 model functions
│   └── rq4_plots.R             # RQ4 plot functions
├── figures/                      # Generated plots
│   ├── rq1/                    # 8 plots for RQ1
│   ├── rq2/                    # 6 plots for RQ2
│   ├── rq3/                    # 8 plots for RQ3
│   └── rq4/                    # 8 plots for RQ4
├── report/
│   ├── STT 180 Final Project Report.pdf
│   |── Model_Equations.pdf
|   └── Model_Equations.Rmd
└── run_all.R                    # Master script
```

## Output

Running the analysis generates:

- **Cleaned dataset**: `data_clean/SpeedDatingClean.rds`
- **30 total figures**: Organized by research question in the `figures/` directory
  - RQ1: 8 plots (histograms, residual diagnostics, interaction plots)
  - RQ2: 6 plots (predictor distributions, fitted probabilities, residuals)
  - RQ3: 8 plots (histograms, residual diagnostics, scatterplots)
  - RQ4: 8 plots (histograms, boxplots, Q-Q plots)


## Data Description

The cleaned dataset contains 18 variables:

- **Outcome variables**: LikeM, LikeF (romantic liking), DecisionM, DecisionF (second date decision)
- **Personality ratings**: Attractive, Sincere, Intelligent, Fun, Ambitious, SharedInterests
- **Perception variables**: PartnerYesM, PartnerYesF (perceived partner interest)
- **Demographics**: AgeM, AgeF

All variables are integers with no missing values.

## Notes

- The data cleaning script (`0_clean_data.R`) must be run before any analysis
- All scripts assume the working directory is set to the project folder
- The project uses only base R and the `tidyverse` package
