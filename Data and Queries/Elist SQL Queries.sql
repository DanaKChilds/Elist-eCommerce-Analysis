-- What is the date of the earliest and latest order, returned in one query?

SELECT MIN(purchase_ts) AS earliest_order_date, MAX(purchase_ts) AS latest_order_date
FROM core.orders;

-- What is the average order value for purchases made in USD? What about average order value for purchases made in USD in 2019?

SELECT ROUND(AVG(usd_price),2) AS AOV
FROM core.orders
WHERE currency = 'USD';

SELECT ROUND(AVG(usd_price),2) AS AOV_2019
FROM core.orders
WHERE currency = 'USD' AND purchase_ts BETWEEN DATE '2019-01-01' AND DATE '2019-12-31';

-- Return the id, loyalty program status, and account creation date for customers who made an account on desktop or mobile. Rename the columns to more descriptive names.
SELECT id AS customer_id,
loyalty_program AS loyalty_program_status,
created_on AS account_creation_date
FROM core.customers_orig
WHERE account_creation_method in ('desktop','mobile');

-- What are all the unique products that were sold in AUD on website, sorted alphabetically?

SELECT DISTINCT product_name
FROM core.orders
WHERE currency = 'AUD' AND purchase_platform = 'website'
ORDER BY product_name;

-- What are the first 10 countries in the North American region, sorted in descending alphabetical order?

SELECT country
FROM core.geo_lookup
WHERE region = 'NA'
ORDER BY country DESC
LIMIT 10;

-- What is the total number of orders by shipping month, sorted from most recent to oldest?

SELECT DATE_TRUNC(order_status.ship_ts, month) AS ship_month, COUNT(DISTINCT orders.id) AS monthly_orders
FROM core.orders
LEFT JOIN core.order_status
ON orders.id = order_status.order_id
GROUP BY DATE_TRUNC(order_status.ship_ts, month)
ORDER BY ship_month DESC;

-- What is the average order value by year? Can you round the results to 2 decimals?

SELECT DATE_TRUNC(purchase_ts, year) AS year, ROUND(AVG(usd_price)) AS AOV
FROM core.orders
GROUP BY year;

-- Create a helper column `is_refund`  in the `order_status`  table that returns 1 if there is a refund, 0 if not. Return the first 20 records.

SELECT CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END AS is_refund
FROM core.order_status
LIMIT 20;

-- Return the product IDs and product names of all Apple products.

SELECT DISTINCT product_id, product_name
FROM core.orders
WHERE product_name LIKE 'Apple%' OR product_name = 'Macbook Air Laptop';

-- Calculate the time to ship in days for each order and return all original columns from the table.

SELECT *, DATE_DIFF(delivery_ts, ship_ts, day) AS ship_time
FROM core.order_status;

-- What is the refund rate per year, expressed as a percent (i.e. 0.0445 should be shown as 44.5)? Can you round this to 2 decimals? 

WITH refund AS
(SELECT order_id, CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END AS is_refund
FROM core.order_status)

SELECT DATE_TRUNC(purchase_ts, year) AS year, ROUND(SUM(refund.is_refund)/COUNT(order_status.order_id) * 100)
FROM core.order_status
JOIN refund
ON refund.order_id = order_status.order_id
GROUP BY year;

-- What is the total number of orders per year for each product? Clean up product names when grouping and return in alphabetical order after sorting by months. 
---- Viewing individual product names

SELECT DISTINCT product_name
FROM core.orders
ORDER BY product_name;

---- Cleaning up product names

SELECT DATE_TRUNC(purchase_ts, month) AS month, CASE WHEN product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE product_name END AS clean_product_name, COUNT(DISTINCT id) as count
FROM core.orders
GROUP BY month, clean_product_name
ORDER BY month, clean_product_name;

-- What is the average order value per year for products that are either laptops or headphones? Round this to 2 decimals.

SELECT DATE_TRUNC(purchase_ts, year) as year, ROUND(AVG(usd_price), 2) AS AOV
FROM core.orders
WHERE LOWER(product_name) LIKE '%laptop%' OR LOWER(product_name) LIKE '%headphones%'
GROUP BY year
ORDER BY year;
-- What were the order counts, sales, and AOV for Macbooks sold in North America for each quarter across all years? 

SELECT DATE_TRUNC(purchase_ts, quarter) AS quarter, COUNT(orders.id) AS order_count, ROUND(SUM(usd_price),2) AS total_sales, ROUND(AVG(usd_price),2) AS AOV
FROM core.orders
JOIN core.customers
ON orders.customer_id = customers.id
JOIN core.geo_lookup
ON customers.country_code = geo_lookup.country
WHERE orders.product_name = 'Macbook Air Laptop' AND region = 'NA'
GROUP BY quarter
ORDER BY quarter;

-- What is the average quarterly order count and total sales for Macbooks sold in North America? (i.e. “For North America Macbooks, average of X units sold per quarter and Y in dollar sales per quarter”)

WITH quarterly_orders AS
(SELECT DATE_TRUNC(orders.purchase_ts, quarter) AS quarter, COUNT(orders.id) AS average_count, SUM(orders.usd_price) AS total_sales
FROM core.orders
JOIN core.customers
ON customers.id = orders.customer_id
JOIN core.geo_lookup
ON customers.country_code = geo_lookup.country 
WHERE orders.product_name LIKE '%Macbook%' AND region = "NA"
GROUP BY quarter
ORDER BY quarter DESC)

SELECT ROUND(AVG(average_count),2) AS avg_quarter_count, ROUND(AVG(total_sales),2) AS avg_quarter_sales
FROM quarterly_orders;

-- For products purchased in 2022 on the website or products purchased on mobile in any year, which region has the average highest time to deliver? 

SELECT geo_lookup.region AS region, ROUND(AVG(TIMESTAMP_DIFF(order_status.delivery_ts, order_status.purchase_ts, day)),2) AS time_to_delivery
FROM core.orders
JOIN core.customers
ON orders.customer_id = customers.id
JOIN core.geo_lookup
ON customers.country_code = geo_lookup.country
JOIN core.order_status
ON orders.id = order_status.order_id
WHERE (EXTRACT(YEAR FROM orders.purchase_ts) = 2022 AND orders.purchase_platform = 'website') OR orders.purchase_platform = 'mobile'
GROUP BY region
ORDER BY time_to_delivery DESC;

-- Rewrite this query for website purchases made in 2022 or Samsung purchases made in 2021, expressing time to deliver in weeks instead of days.

SELECT geo_lookup.region AS region, ROUND(AVG(TIMESTAMP_DIFF(order_status.delivery_ts, order_status.purchase_ts, week)),2) AS time_to_delivery
FROM core.orders
JOIN core.customers
ON orders.customer_id = customers.id
JOIN core.geo_lookup
ON customers.country_code = geo_lookup.country
JOIN core.order_status
ON orders.id = order_status.order_id
WHERE (EXTRACT(YEAR FROM orders.purchase_ts) = 2022 AND orders.purchase_platform = 'website') OR (EXTRACT(YEAR FROM orders.purchase_ts) = 2021 AND orders.product_name LIKE 'Samsung%')
GROUP BY region
ORDER BY time_to_delivery DESC;

-- What was the refund rate and refund count for each product overall? 

WITH refund AS
(SELECT order_id, CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END AS is_refund
FROM core.order_status)

SELECT CASE WHEN product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE product_name END AS product_name, ROUND(SUM(refund.is_refund)/COUNT(order_status.order_id),2) AS refund_rate_percent, COUNT(refund.is_refund) AS count
FROM core.order_status
JOIN refund
ON refund.order_id = order_status.order_id
JOIN core.orders
ON orders.id = order_status.order_id
GROUP BY product_name
ORDER BY product_name;

-- What was the refund rate and refund count for each product per year? How would you interpret these rates in English?

SELECT CASE WHEN product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE product_name END AS clean_product_name, SUM(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END) AS refunds, AVG(CASE WHEN refund_ts IS NOT NULL THEN 1 ELSE 0 END) as refund_rate
FROM core.orders
JOIN core.order_status
ON orders.id = order_status.order_id
GROUP BY clean_product_name
ORDER BY refund_rate;

-- Within each region, what is the most popular product? 
WITH popular_product AS
(SELECT region, CASE WHEN orders.product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE product_name END AS product_name, COUNT(orders.id) AS count
FROM core.orders
JOIN core.customers
ON orders.customer_id = customers.id
JOIN core.geo_lookup
ON customers.country_code = geo_lookup.country
GROUP BY region, product_name
ORDER BY region)

SELECT *, ROW_NUMBER() OVER (PARTITION BY region ORDER BY count DESC) AS order_rank
FROM popular_product
QUALIFY row_number() OVER (PARTITION BY region ORDER BY count DESC) = 1;

-- How does the time to make a purchase differ between loyalty customers vs. non-loyalty customers? 

SELECT loyalty_program, ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers.created_on, day)),2) AS creation_to_purchase_time 
FROM core.customers
JOIN core.orders
ON customers.id = orders.customer_id
GROUP BY loyalty_program;

-- Update this query to split the time to purchase per loyalty program, per purchase platform. Return the number of records to benchmark the severity of nulls.

SELECT orders.purchase_platform, customers.loyalty_program, ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers.created_on, day)), 1) AS days_to_purchase, ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers.created_on, month)), 1) AS months_to_purchase, COUNT(*) AS row_count
FROM core.customers
JOIN core.orders
ON customers.id = orders.customer_id
GROUP BY orders.purchase_platform, customers.loyalty_program;
