import sqlite3
import pandas as pd

conn = sqlite3.connect("bluestock_mf.db")

datasets = {
    "fact_nav": "data/processed/clean_nav.csv",
    "fact_transactions": "data/processed/clean_transactions.csv",
    "fact_performance": "data/processed/clean_performance.csv",
    "dim_fund": "data/raw/01_fund_master.csv"
}

print("=" * 60)
print("ROW COUNT VERIFICATION")
print("=" * 60)

for table, csv_file in datasets.items():
    csv_rows = len(pd.read_csv(csv_file))
    db_rows = conn.execute(f"SELECT COUNT(*) FROM {table}").fetchone()[0]

    print(f"{table}")
    print(f"CSV Rows      : {csv_rows}")
    print(f"Database Rows : {db_rows}")

    if csv_rows == db_rows:
        print("Status : MATCH")
    else:
        print("Status : MISMATCH")

    print("-" * 40)

conn.close()