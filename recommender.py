import pandas as pd
performance = pd.read_csv("data/raw/07_scheme_performance.csv")

def recommend_funds(risk_level):
    filtered = performance[
        performance["risk_grade"].str.lower() == risk_level.lower()
    ]
    recommendations = (
        filtered
        .sort_values("sharpe_ratio", ascending=False)
        .head(3)
    )
    return recommendations[
        [
            "scheme_name",
            "fund_house",
            "category",
            "risk_grade",
            "sharpe_ratio",
            "return_3yr_pct"
        ]
    ]

if __name__ == "__main__":
    risk = input("Enter Risk Appetite (Low / Moderate / High / Very High): ")
    print("\nTop Recommended Mutual Funds:\n")
    print(recommend_funds(risk))