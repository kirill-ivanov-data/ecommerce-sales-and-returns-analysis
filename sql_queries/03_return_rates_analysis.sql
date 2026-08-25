---- Returned_rate
-- return rate for each product, market, and region
SELECT
	o.product_id
	, p.product_name
	, o.market
	, o.region
	, ROUND(COUNT(ro.order_id) / COUNT(o.order_id)::DECIMAL, 3) AS returned_rate -- returned_rate for each product, market and region
FROM orders AS o
  -- make sure to use a left join so that all orders are included in the result, since not all of them were returned
	LEFT JOIN returned_orders AS ro
		ON o.order_id = ro.order_id
		AND o.market = ro.market
  -- add the "products" table to display the product names
	LEFT JOIN products AS p
		ON o.product_id = p.product_id
GROUP BY o.product_id, p.product_name, o.market, o.region
ORDER BY returned_rate DESC;

--- identify which product categories and subcategories are returned most frequently
-- table with the return rate for each product
WITH returned_rate_table AS (
	SELECT
		o.product_id
		, ROUND(COUNT(ro.order_id) / COUNT(o.order_id)::DECIMAL, 3) AS returned_rate -- returned_rate for each product
	FROM orders AS o
		LEFT JOIN returned_orders AS ro
			ON o.order_id = ro.order_id
			AND o.market = ro.market
		LEFT JOIN products AS p
			ON o.product_id = p.product_id
	GROUP BY o.product_id
)

-- for each category and subcategory, we calculate the number of returned items and the average return rate
SELECT
	category
	, sub_category
	, COUNT(rrt.product_id) AS count_high_returned_rate -- number of returned items in the subcategory
	, ROUND(AVG(returned_rate), 3) AS avg_returned_rate -- the average return rate
FROM products AS p
	LEFT JOIN returned_rate_table AS rrt
		ON p.product_id = rrt.product_id
  -- only products with a critically high return rate
		AND rrt.returned_rate > 0.5
GROUP BY category, sub_category
  -- the task is to identify instances of systematic product returns within subcategories; therefore, we are not interested in cases involving only a single return
HAVING COUNT(rrt.product_id) > 1
ORDER BY 1, 2, 3, 4;
