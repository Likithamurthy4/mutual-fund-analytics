-- 1. Top 5 Fund Houses by AUM
SELECT fund_house,
MAX(aum_crore) AS total_aum
FROM fact_aum
GROUP BY fund_house
ORDER BY total_aum DESC
LIMIT 5;

-- 2. Average NAV per Month
SELECT strftime('%Y-%m', nav_date) AS month,
AVG(nav) AS average_nav
FROM fact_nav
GROUP BY month
ORDER BY month;

-- 3. Total Transactions by State
SELECT state,
COUNT(*) AS total_transactions
FROM fact_transactions
GROUP BY state
ORDER BY total_transactions DESC;

-- 4. Funds with Expense Ratio below 1%
SELECT scheme_name,
expense_ratio_pct
FROM dim_fund
WHERE expense_ratio_pct < 1;

-- 5. Transaction Type Distribution
SELECT transaction_type,
COUNT(*) AS total
FROM fact_transactions
GROUP BY transaction_type;

-- 6. Average 3-Year Return
SELECT AVG(return_3yr_pct)
FROM fact_performance;

-- 7. Top 10 Schemes by Transactions
SELECT amfi_code,
COUNT(*) AS total_transactions
FROM fact_transactions
GROUP BY amfi_code
ORDER BY total_transactions DESC
LIMIT 10;

-- 8. Highest Sharpe Ratio Funds
SELECT amfi_code,
sharpe_ratio
FROM fact_performance
ORDER BY sharpe_ratio DESC
LIMIT 10;

-- 9. Total Investment Amount
SELECT SUM(amount_inr)
FROM fact_transactions;

-- 10. Monthly Transaction Count
SELECT strftime('%Y-%m', transaction_date) AS month,
COUNT(*) AS transactions
FROM fact_transactions
GROUP BY month
ORDER BY month;