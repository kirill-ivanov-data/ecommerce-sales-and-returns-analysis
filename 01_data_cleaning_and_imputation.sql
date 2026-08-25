-- The table of product prices for each individual market and region (price divided by quantity, for cases with no missing values)
WITH product_price AS (
	SELECT DISTINCT
		product_id
		, discount
		, market
		, region
		, (sales / quantity) AS price
	FROM orders
	WHERE sales IS NOT NULL
	AND quantity IS NOT NULL
	AND product_id IS NOT NULL
)

-- Fill in missing values ​​based on the price column
SELECT DISTINCT
	o.product_id
	, o.discount
	, o.market
	, o.region
	, o.sales
	, o.quantity
	, COALESCE(o.quantity, ROUND((sales / price)::DECIMAL, 0)) AS calculated_quantity -- If there are no missing values ​​in the "quantity" column, leave it as is; 
                                                                                    --if there are missing values, calculate the quantity based on sales and price
FROM orders AS o
	LEFT JOIN product_price AS pp -- for each product, we add its price, taking into account the market, discounts, and the region
	  ON o.product_id = pp.product_id
	    AND o.discount = pp.discount
      AND o.market = pp.market
      AND o.region = pp.region;
