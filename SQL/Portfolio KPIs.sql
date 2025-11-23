-- Portfolio KPI's --

-- Overall Default Rate -- 
SELECT
  COUNT(*) AS total_loans,
  SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS total_defaults,
  ROUND(100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate_pct
FROM loans_features;

-- Default rate by Loan Grade -- 
SELECT loan_grade,
       COUNT(*) AS n_loans,
       SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaults,
       ROUND(100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_pct
FROM loans_features
GROUP BY loan_grade
ORDER BY loan_grade;

-- Default rate by Income Band --
SELECT income_band,
       COUNT(*) AS n,
       SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaults,
       ROUND(100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_pct
FROM loans_features
GROUP BY income_band
ORDER BY default_pct DESC;

-- Default rate by Age Bucket --
SELECT age_bucket,
       COUNT(*) AS n,
       SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) defaults,
       ROUND(100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_pct
FROM loans_features
GROUP BY age_bucket
ORDER BY default_pct DESC;