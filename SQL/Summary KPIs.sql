-- Summary KPI's -- 
SELECT
  COUNT(*) AS total_loans,
  SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS total_defaults,
  ROUND(100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) / COUNT(*),2) AS default_rate_pct,
  ROUND(AVG(loan_int_rate),2) AS avg_interest_rate,
  ROUND(AVG(pct_income),3) AS avg_pct_income,
  ROUND(AVG(clean_person_emp_length),2) AS avg_emp_years,
  ROUND(AVG(person_cred_hist_length),2) AS avg_cred_hist_years
FROM loans_features;