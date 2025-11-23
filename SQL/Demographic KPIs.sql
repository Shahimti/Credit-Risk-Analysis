-- Demographic KPI's --

-- Default rate by Employment Rate Bucket -- 
SELECT emp_length_bucket,
       COUNT(*) AS n,
       SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) AS defaults,
       ROUND(100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_pct
FROM loans_features
GROUP BY emp_length_bucket
ORDER BY default_pct DESC;

-- Default rate by Credit History Bucket --
SELECT cred_hist_bucket,
       COUNT(*) AS n,
       SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) defaults,
       ROUND(100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_pct
FROM loans_features
GROUP BY cred_hist_bucket
ORDER BY default_pct DESC;

-- Default rate by Loan Intent -- 
SELECT loan_intent,
       COUNT(*) AS n,
       SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) defaults,
       ROUND(100.0 * SUM(CASE WHEN loan_status = 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_pct
FROM loans_features
GROUP BY loan_intent
ORDER BY default_pct DESC;