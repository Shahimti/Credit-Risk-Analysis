-- Interest Rate KPI's -- 

-- Default rate by Interest Rate Bucket -- 
SELECT int_rate_bucket,
       COUNT(*) AS n,
       SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) defaults,
       ROUND(100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_pct,
       ROUND(AVG(loan_int_rate),2) AS avg_int_rate
FROM loans_features
GROUP BY int_rate_bucket
ORDER BY int_rate_bucket;

-- Default rate by PCT Income Bucket -- 
SELECT pct_income_bucket,
       COUNT(*) AS n,
       SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) defaults,
       ROUND(100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_pct,
       ROUND(AVG(pct_income),3) AS avg_pct_income
FROM loans_features
GROUP BY pct_income_bucket
ORDER BY default_pct DESC;