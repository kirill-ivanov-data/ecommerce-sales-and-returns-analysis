# Ecommerce sales and returns analysis
[Читати українською](README_ua.md)
Online store sales analysis, missing data recovery, and return metrics calculation (SQL + Tableau)
### Link to the dashboard: https://public.tableau.com/views/Salesandreturnsanalysis_dashboard/Salesandreturnsanalysis?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

## Description:
This project involves analyzing online store data to identify the most profitable products in each category and investigate the reasons for order returns. Data processing and cleaning were primarily performed using SQL, while key metrics were visualized in Tableau.

## Tools and Technologies:
* **Database:** Google BigQuery
* **SQL:** Window functions, CTEs, JOINs, aggregations, COALESCE.
* **Visualization:** Tableau

## Repository structure
* `sql_queries/` - folder containing SQL scripts:
* `01_data_cleaning_and_imputation.sql` - imputation of missing values ​​(quantity) based on the calculated average product price. 
* `02_top_products_ranking.sql` - ranking of the top 5 products in each category by sales volume. 
* `03_return_rates_analysis.sql` - calculation of return rates by product and category.
* `data_dictionary.md` - description of the source database table structures.
