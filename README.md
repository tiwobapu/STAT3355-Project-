# Olympic Swimming Performance & Socioeconomic Analysis

**Course:** STAT 3355 — Introduction to Data Analysis | UT Dallas  
**Language:** R  
**Dataset Period:** 1896–2020 Summer Olympics (124 years)

## Overview

This project investigates the relationship between a nation's socioeconomic resources and its dominance in Olympic swimming. By merging 124 years of Olympic records with World Bank GDP and population data, we analyze how wealth, demographics, and geography shape global swimming performance — and reveal structural inequities in international sports.

## Research Questions

**Primary:** What is the correlation between a nation's socioeconomic resources and its dominance in Olympic swimming?

**Sub-questions explored:**
- Does GDP per capita predict total swimming medal count?
- Is there a minimum wealth threshold required to win a first swimming medal?
- Does population size correlate more strongly with relay vs. individual event success?
- How does the average age of medalists vary between high-income and low-income countries?
- Do former Olympic host cities show a long-term increase in swimming performance?
- Is there a statistically significant difference in win rates between coastal and landlocked nations?

## Data Sources

| Dataset | Source |
|--------|--------|
| Summer Olympics Results (1896–2020) | [Our World in Data](https://ourworldindata.org) |
| GDP per Capita | [World Bank](https://ourworldindata.org/grapher/gdp-per-capita-worldbank) |
| Population Data | [World Bank](https://data.worldbank.org/indicator/SP.POP.TOTL) |

## Methods

- **Exploratory Data Analysis** — distribution of medals by country, age, and event type
- **Correlation Analysis** — GDP per capita vs. medal count; population vs. relay performance
- **Regression Modeling** — predicting swimming success from socioeconomic indicators
- **Hypothesis Testing** — comparing win rates between high/low GDP nations; coastal vs. landlocked countries
- **Visualization** — ggplot2 charts showing trends across 124 years of Olympic history

## Key Variables

- Medal outcomes (Gold / Silver / Bronze) by athlete, country, event, and year
- Athlete age and gender
- Country GDP per capita (World Bank)
- Country population size
- Host city history
- Coastal vs. landlocked classification

## Tools & Libraries

```r
library(tidyverse)
library(ggplot2)
library(dplyr)
library(corrplot)
```

## Repository Structure

```
STAT3355-Project-/
├── data/           # Raw and cleaned datasets
├── analysis/       # R scripts for each research question
├── plots/          # Generated visualizations
└── report/         # Final write-up and findings
```

## Skills Demonstrated

- Data wrangling and merging across multiple real-world datasets
- Statistical modeling and hypothesis testing in R
- Data visualization with ggplot2
- Communicating analytical findings to non-technical audiences
