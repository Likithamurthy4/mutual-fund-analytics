import pandas as pd
import os

folder = "data/raw"

for file in os.listdir(folder):
    if file.endswith(".csv"):
        path = os.path.join(folder, file)

        df = pd.read_csv(path)

        print("\n" + "="*50)
        print(file)
        print("Shape:", df.shape)
        print("\nDtypes:")
        print(df.dtypes)
        print("\nHead:")
        print(df.head())
import pandas as pd

fund = pd.read_csv("data/raw/01_fund_master.csv")

print("\nFund Houses")
print(fund["fund_house"].unique())

print("\nCategories")
print(fund["category"].unique())

print("\nSub Categories")
print(fund["sub_category"].unique())

print("\nRisk Categories")
print(fund["risk_category"].unique())
fund = pd.read_csv("data/raw/01_fund_master.csv")
nav = pd.read_csv("data/raw/02_nav_history.csv")

missing = set(fund["amfi_code"]) - set(nav["amfi_code"])

print("Missing codes:", missing)