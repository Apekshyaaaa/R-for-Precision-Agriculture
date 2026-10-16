# North Dakota Corn and Soybean Yield Analysis (2000-2025)

## Overview
This project explores historical corn and soybean yield trends in North Dakota using annual USDA NASS Quick Stats data from 2000 to 2025.

## Objectives
- Analyze annual corn and soybean yields.
- Calculate descriptive statistics.
- Visualize historical yield trends.
- Estimate linear trends using regression analysis in R.

## Data Source
USDA National Agricultural Statistics Service (NASS), Quick Stats.

https://quickstats.nass.usda.gov/

## Methods
Data were imported and cleaned using base R. Descriptive statistics and ordinary least squares linear regression were used to examine annual yield patterns.

## Key Findings
- Corn yield showed a positive linear trend of approximately 1.42 bushels per acre per year (p = 0.00022).
- Soybean yield had an estimated positive slope of 0.16 bushels per acre per year, but the trend was not statistically significant at the 5% level (p = 0.116).

## Limitations
The analysis is exploratory. It does not establish the causes of yield changes, and regression assumptions, including temporal independence, require further evaluation.

## Tools
R, RStudio, GitHub.
