import pandas as pd

print("=" * 50)
print("CLEANING NAV HISTORY")

nav = pd.read_csv("data/raw/02_nav_history.csv")
nav["date"] = pd.to_datetime(nav["date"])
nav = nav.sort_values(["amfi_code", "date"])
nav["nav"] = nav.groupby("amfi_code")["nav"].ffill()
nav = nav.drop_duplicates()
nav = nav[nav["nav"] > 0]
nav.to_csv("data/processed/clean_nav.csv", index=False)
print("NAV rows:", len(nav))
print("=" * 50)
print("CLEANING INVESTOR TRANSACTIONS")

txn = pd.read_csv("data/raw/08_investor_transactions.csv")
txn["transaction_date"] = pd.to_datetime(txn["transaction_date"])
txn["transaction_type"] = (
    txn["transaction_type"]
    .str.strip()
    .str.title()
)
valid_types = ["Sip", "Lumpsum", "Redemption"]
txn = txn[txn["transaction_type"].isin(valid_types)]
txn = txn[txn["amount_inr"] > 0]
print("KYC Status Values:")
print(txn["kyc_status"].unique())
txn.to_csv(
    "data/processed/clean_transactions.csv",
    index=False
)
print("Transaction rows:", len(txn))
print("=" * 50)
print("CLEANING SCHEME PERFORMANCE")
perf = pd.read_csv(
    "data/raw/07_scheme_performance.csv"
)
return_cols = [
    "return_1yr_pct",
    "return_3yr_pct",
    "return_5yr_pct"
]
for col in return_cols:
    perf[col] = pd.to_numeric(
        perf[col],
        errors="coerce"
    )
negative_sharpe = perf[
    perf["sharpe_ratio"] < 0
]
print("Negative Sharpe rows:")
print(len(negative_sharpe))
expense_outliers = perf[
    (perf["expense_ratio_pct"] < 0.1)
    | (perf["expense_ratio_pct"] > 2.5)
]
print("Expense Ratio Outliers:")
print(len(expense_outliers))
perf.to_csv(
    "data/processed/clean_performance.csv",
    index=False
)
print("Performance rows:", len(perf))
print("=" * 50)
print("DAY 2 CLEANING COMPLETE")