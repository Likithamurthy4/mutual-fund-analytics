-- 1. Top 5 Fund Houses by AUM
SELECT fund_house,
MAX(aum_crore) AS total_aum
FROM dim_fund
GROUP BY fund_house
ORDER BY total_aum DESC
LIMIT 5;

-- 2. Average NAV by Scheme
SELECT amfi_code,
AVG(nav) AS average_nav
FROM fact_nav
GROUP BY amfi_code;

-- 3. Total Transactions by State
SELECT state,
COUNT(*) AS transaction_count
FROM fact_transactions
GROUP BY state
ORDER BY transaction_count DESC;

-- 4. Total Investment Amount by Transaction Type
SELECT transaction_type,
SUM(amount_inr) AS total_amount
FROM fact_transactions
GROUP BY transaction_type;

-- 5. Funds with Expense Ratio Below 1%
SELECT scheme_name,
expense_ratio_pct
FROM dim_fund
WHERE expense_ratio_pct < 1;

-- 6. Top 10 Most Active Schemes
SELECT amfi_code,
COUNT(*) AS total_transactions
FROM fact_transactions
GROUP BY amfi_code
ORDER BY total_transactions DESC
LIMIT 10;

-- 7. Average 3-Year Return
SELECT AVG(return_3yr_pct) AS avg_return
FROM fact_performance;

-- 8. Highest Sharpe Ratio Funds
SELECT amfi_code,
sharpe_ratio
FROM fact_performance
ORDER BY sharpe_ratio DESC
LIMIT 10;

-- 9. KYC Status Distribution
SELECT kyc_status,
COUNT(*) AS total
FROM fact_transactions
GROUP BY kyc_status;

-- 10. Monthly NAV Trend
SELECT strftime('%Y-%m', date) AS month,
AVG(nav) AS avg_nav
FROM fact_nav
GROUP BY month
ORDER BY month;