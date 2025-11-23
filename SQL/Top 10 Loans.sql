-- Top 10 Calculations --

-- Top 10 Loans by Loan Amount -- 
SELECT *
FROM loans_features
ORDER BY loan_amnt DESC
LIMIT 10;