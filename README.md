**Credit Risk Analysis (SQL Project)**

Author: Shah The Analyst

Tools Used: MySQL Server, MySQL Workbench, Power BI (for data cleaning)

Dataset: Kaggle – Credit Risk Dataset

**Project Overview**

This project analyzes borrower behavior to understand which factors contribute most to credit default.Compared to typical SQL projects that 
only show technical queries, the focus here is on business insight, risk segmentation, and credit behavior patterns.

The guiding question for this project was:

**“What characteristics separate high-risk borrowers from low-risk borrowers?”**

To answer this, the workflow included:

- Data cleaning using Power BI / Power Query

- Feature engineering

- SQL-based bucketing and segmentation

- Detailed risk pattern analysis

- Portfolio-level KPIs and borrower insights

**Objective**

The project aims to:

Clean and prepare 28,578 loan records

Engineer analytical features such as:

- Age buckets

- Income bands

- Employment length buckets

- Interest rate buckets

- Credit history buckets

- Affordability (PCT income buckets)

- Build SQL segmentation models

- Calculate portfolio and segment-level risk metrics

- Identify borrower groups with the highest default probability

**Dataset Summary**

#Customer-Level Features:

- age

- income

- person_home_ownership

- clean_person_emp_length

- person_cred_hist_length

- Loan Features

- loan_intent

- loan_grade (A–G)

- loan_amnt

- loan_int_rate

- pct_income

- Target Variable

- default_flag (1 = defaulted, 0 = repaid)

#Derived Features (Engineered)

- age_bucket

- income_band

- emp_length_bucket

- cred_hist_bucket

- int_rate_bucket

- pct_income_bucket

- debt_to_income

- loan_grade_score

**Data Cleaning Process (Power BI / Power Query)**

- Initial data cleaning was completed in Power BI before loading the final dataset into MySQL.

#Key steps included:

- Handling missing or inconsistent values

- Replacing incorrect ages and employment lengths with median values

- Converting financial fields to numeric types

- Standardizing categorical columns

- Creating segmentation buckets (income, age, interest rate, credit history)

- Ensuring consistent binary encoding for default_flag

**Feature Engineering (SQL View)**

A master SQL view was created to combine all engineered features into a single analytical table.

#This view included:

- Age bucket

- Income band

- Employment length bucket

- Credit history bucket

- Interest rate bucket

- Affordability (PCT income bucket)

- Debt-to-income

- Loan grade numeric score

This ensured consistent segmentation across all KPIs and risk queries.

**Key Insights & Results**

| Area | KPI / Segment | Observation |
|------|---------------|-------------|
| Portfolio Health | Default Rate | 21.74% of loans defaulted |
| Loan Grade | A → G | Default risk rises from 9.82% to 98.25% |
| Income Band | <10k Income | 86.96% default rate |
| Income Band | Mid Income | 34.39% default |
| Income Band | High Income | 18.70% default |
| Age Bucket | 18–24 | 23.09% default |
| Employment Length | <1 year | 24.67% default |
| Employment Length | 8+ years | 18.25% default |
| Credit History | <3 years | 23.36% default |
| Credit History | 7–10 years | 20.31% default |
| Loan Intent | Debt Consolidation | Highest default rates |
| Interest Rate Bucket | >20% | 88.06% default |
| Interest Rate Bucket | <8% | 9.17% default |
| Affordability (PCT Income) | >60% | 74.07% default |
| Affordability (PCT Income) | <20% | 33.32% default |


**Example SQL Query**

-- Summary KPIs
SELECT
    COUNT(*) AS total_loans,
    
    SUM(CASE WHEN default_flag = 1 THEN 1 ELSE 0 END) AS total_defaults,
    
    ROUND(100.0 * SUM(CASE WHEN default_flag = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate_pct,
    
    ROUND(AVG(loan_int_rate), 2) AS avg_interest_rate,
    
    ROUND(AVG(pct_income), 3) AS avg_pct_income,
    
    ROUND(AVG(clean_person_emp_length), 2) AS avg_emp_years,
    
    ROUND(AVG(person_cred_hist_length), 2) AS avg_cred_hist_years
    
FROM loan_features;

**Personal Reflection**

This project helped me connect data cleaning, feature engineering, and SQL analytics into one cohesive workflow.
I learned how:

Small cleaning decisions (handling invalid ages, missing interest rates)
directly influence final insights

SQL-derived business metrics can clearly explain credit behavior

Borrower risk is measurable through structured segmentation

This was more than just writing SQL queries—
it was understanding why borrowers default, and how data can help predict and prevent risk.
