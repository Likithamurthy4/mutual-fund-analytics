# Mutual Fund Analytics - Data Dictionary

## Project Overview
This project analyses mutual fund performance, NAV trends, investor transactions, AUM growth, SIP inflows, and portfolio holdings using a structured SQLite database and analytical SQL queries.

---

## Dataset 1: Fund Master

**File:** 01_fund_master.csv

Contains master information about all mutual fund schemes.

| Column Name | Data Type | Description |
|-------------|------------|-------------|
| amfi_code | INTEGER | Unique AMFI scheme identifier |
| fund_house | TEXT | Mutual fund company name |
| scheme_name | TEXT | Name of the mutual fund scheme |
| category | TEXT | Fund category |
| sub_category | TEXT | Fund sub-category |
| plan | TEXT | Direct or Regular plan |
| launch_date | DATE | Scheme launch date |
| benchmark | TEXT | Benchmark index |
| expense_ratio_pct | REAL | Expense ratio percentage |
| risk_category | TEXT | Risk classification |

---

## Dataset 2: NAV History

**File:** 02_nav_history.csv

Stores historical NAV values for mutual fund schemes.

| Column Name | Data Type | Description |
|-------------|------------|-------------|
| amfi_code | INTEGER | Scheme identifier |
| date | DATE | NAV date |
| nav | REAL | Net Asset Value |

---

## Dataset 3: Investor Transactions

**File:** 08_investor_transactions.csv

Contains investor purchase, SIP, and redemption transactions.

| Column Name | Data Type | Description |
|-------------|------------|-------------|
| investor_id | TEXT | Unique investor identifier |
| transaction_date | DATE | Transaction date |
| amfi_code | INTEGER | Scheme code |
| transaction_type | TEXT | SIP, Lumpsum, or Redemption |
| amount_inr | REAL | Transaction amount in INR |
| state | TEXT | Investor state |
| city | TEXT | Investor city |
| kyc_status | TEXT | KYC verification status |

---

## Dataset 4: Scheme Performance

**File:** 07_scheme_performance.csv

Contains mutual fund performance and risk metrics.

| Column Name | Data Type | Description |
|-------------|------------|-------------|
| return_1yr_pct | REAL | 1-Year Return |
| return_3yr_pct | REAL | 3-Year Return |
| return_5yr_pct | REAL | 5-Year Return |
| alpha | REAL | Alpha metric |
| beta | REAL | Beta metric |
| sharpe_ratio | REAL | Risk-adjusted return |
| sortino_ratio | REAL | Downside risk metric |
| morningstar_rating | INTEGER | Morningstar rating |