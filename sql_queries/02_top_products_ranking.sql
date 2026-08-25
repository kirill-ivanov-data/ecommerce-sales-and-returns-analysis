---- top_five_products_each_category

-- table showing sales and profit by product and category
WITH group_category_product AS (
	SELECT
		category
		, product_name
		, ROUND(SUM(sales)::DECIMAL, 2) AS product_total_sales
		, ROUND(SUM(profit)::DECIMAL, 2) AS product_total_profit
  --We determine the rank of each product within each category, ranging from the product with the highest sales volume to the one with the lowest
  --using DENSE_RANK() to handle cases where products have identical sales figures
		, DENSE_RANK() OVER (PARTITION BY category ORDER BY SUM(sales)::DECIMAL DESC) AS product_rank
	FROM orders AS o
		LEFT JOIN products AS p
			ON o.product_id = p.product_id
	GROUP BY category, product_name
)

SELECT *
FROM group_category_product
WHERE product_rank <= 5 -- products that make it into the top 5
ORDER BY category ASC, product_total_sales DESC;
