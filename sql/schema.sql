-- Dimension Table: Fund

CREATE TABLE dim_fund (
    amfi_code INTEGER PRIMARY KEY,
    fund_house TEXT,
    scheme_name TEXT,
    category TEXT,
    sub_category TEXT,
    expense_ratio_pct REAL,
    risk_category TEXT
);

-- Dimension Table: Date

CREATE TABLE dim_date (
    date DATE PRIMARY KEY,
    year INTEGER,
    month INTEGER,
    day INTEGER
);

-- Fact Table: NAV

CREATE TABLE fact_nav (
    amfi_code INTEGER,
    nav_date DATE,
    nav REAL,
    PRIMARY KEY (amfi_code, nav_date),
    FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code),
    FOREIGN KEY (nav_date) REFERENCES dim_date(date)
);

-- Fact Table: Transactions

CREATE TABLE fact_transactions (
    investor_id TEXT,
    amfi_code INTEGER,
    transaction_date DATE,
    transaction_type TEXT,
    amount_inr REAL,
    state TEXT,
    city TEXT,
    PRIMARY KEY (investor_id, transaction_date),
    FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code),
    FOREIGN KEY (transaction_date) REFERENCES dim_date(date)
);

-- Fact Table: Performance

CREATE TABLE fact_performance (
    amfi_code INTEGER PRIMARY KEY,
    return_1yr_pct REAL,
    return_3yr_pct REAL,
    return_5yr_pct REAL,
    sharpe_ratio REAL,
    expense_ratio_pct REAL,
    FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code)
);

-- Fact Table: AUM

CREATE TABLE fact_aum (
    fund_house TEXT,
    date DATE,
    aum_crore REAL,
    num_schemes INTEGER
);