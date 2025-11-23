CREATE OR REPLACE VIEW loans_features AS
SELECT
  *, 
  CASE
    WHEN age IS NULL THEN 'Unknown'
    WHEN age < 25 THEN '18-24'
    WHEN age BETWEEN 25 AND 34 THEN '25-34'
    WHEN age BETWEEN 35 AND 44 THEN '35-44'
    WHEN age BETWEEN 45 AND 54 THEN '45-54'
    WHEN age BETWEEN 55 AND 64 THEN '55-64'
    ELSE '65+' END AS age_bucket,
  CASE
    WHEN income IS NULL THEN 'Unknown'
    WHEN income < 10000 THEN '<10k'
    WHEN income BETWEEN 10000 AND 19999 THEN '10-19k'
    WHEN income BETWEEN 20000 AND 29999 THEN '20-29k'
    ELSE '30k+' END AS income_band,
  CASE
    WHEN clean_person_emp_length IS NULL THEN 'Unknown'
    WHEN clean_person_emp_length < 1 THEN '<1yr'
    WHEN clean_person_emp_length BETWEEN 1 AND 3 THEN '1-3yr'
    WHEN clean_person_emp_length BETWEEN 4 AND 7 THEN '4-7yr'
    WHEN clean_person_emp_length BETWEEN 8 AND 12 THEN '8-12yr'
    ELSE '12+yr' END AS emp_length_bucket,
  CASE
    WHEN person_cred_hist_length IS NULL THEN 'Unknown'
    WHEN person_cred_hist_length < 3 THEN '<3yr'
    WHEN person_cred_hist_length BETWEEN 3 AND 6 THEN '3-6yr'
    WHEN person_cred_hist_length BETWEEN 7 AND 10 THEN '7-10yr'
    ELSE '10+yr' END AS cred_hist_bucket,
  CASE
    WHEN loan_int_rate IS NULL THEN 'Unknown'
    WHEN loan_int_rate < 8 THEN '<8%'
    WHEN loan_int_rate BETWEEN 8 AND 11.99 THEN '8-11.99%'
    WHEN loan_int_rate BETWEEN 12 AND 15.99 THEN '12-15.99%'
    WHEN loan_int_rate BETWEEN 16 AND 19.99 THEN '16-19.99%'
    ELSE '20%+' END AS int_rate_bucket,
  CASE
    WHEN pct_income IS NULL THEN 'Unknown'
    WHEN pct_income < 0.2 THEN '<20%'
    WHEN pct_income BETWEEN 0.2 AND 0.39 THEN '20-39%'
    WHEN pct_income BETWEEN 0.4 AND 0.59 THEN '40-59%'
    ELSE '60%+' END AS pct_income_bucket,
  CASE WHEN pct_income IS NULL AND income > 0 THEN ROUND(loan_amnt / NULLIF(income,0),3)
       ELSE pct_income END AS debt_to_income,
  CASE
    WHEN loan_grade = 'A' THEN 1
    WHEN loan_grade = 'B' THEN 2
    WHEN loan_grade = 'C' THEN 3
    WHEN loan_grade = 'D' THEN 4
    WHEN loan_grade = 'E' THEN 5
    WHEN loan_grade = 'F' THEN 6
    WHEN loan_grade = 'G' THEN 7
    ELSE NULL END AS loan_grade_score
FROM cleaned_data_sql;
