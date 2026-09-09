# Olist Sales Intelligence

A customer-retention and sales-prioritization project built with the Olist Brazilian E-Commerce public dataset.

## Objective

Convert transactional marketplace data into a practical customer intelligence workflow:

- Identify high-value customers.
- Identify customers needing retention action.
- Measure revenue, delivery, and review performance.
- Generate an evidence-based customer summary and recommended next action.
- Present the findings in Power BI.

## Business Findings

- 93,358 customers generated R$15.42M in completed-order value.
- 25,017 customers, or 26.8% of the customer base, meet the high-risk proxy criteria.
- The At Risk segment represents R$2.88M in revenue.
- High Value customers generate R$4.89M, or 31.73% of total revenue.
- Active customers have the highest late-delivery rate at 12.79%.

## Data Source

Olist Brazilian E-Commerce public dataset.

The project uses customer, order, order-item, payment, review, product, and category-translation tables.

## Method

1. Cleaned and joined completed orders in Python.
2. Aggregated item, payment, and review data to one row per order.
3. Created a customer-level 360 table using `customer_unique_id`.
4. Calculated RFM-style recency, frequency, and monetary scores.
5. Assigned customer segments: High Value, Active, New, At Risk, and Inactive.
6. Created a transparent risk proxy from recency and customer feedback.
7. Generated a customer summary and recommended next action using explicit business rules.
8. Loaded the output into DuckDB for SQL analysis and Power BI for reporting.

## Deliverables

- `data/processed/order_fact.csv` - completed-order analysis table.
- `data/processed/customer_360.csv` - customer-level sales intelligence table.
- `data/olist_sales_intelligence.duckdb` - local SQL database.
- `data/sql/01_business_metrics.sql` - business analysis queries.
- `data/notebooks/02_build_customer_360.ipynb` - Python ETL and feature engineering.
- `data/notebooks/03_sql_analysis.ipynb` - SQL analysis.
- `dashboard/olist_sales_intelligence.pbix` - Power BI dashboard.

## Dashboard

The Power BI report contains:

- Sales Intelligence Overview: revenue, customer count, at-risk revenue, high-risk customer count, revenue trends, segment performance, and risk distribution.
- Customer Action Queue: a prioritized list of high-risk customers with customer summaries and recommended actions.

## Technology

- Python
- pandas
- DuckDB
- SQL
- Power BI

## Important Note

The risk level is a transparent business heuristic based on historical purchase recency and review feedback. It is not a machine-learning churn prediction model.