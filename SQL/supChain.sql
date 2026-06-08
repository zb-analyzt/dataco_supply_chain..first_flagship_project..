CREATE DATABASE supply_chain;

USE supply_chain;

--                       INITIAL EDA

SELECT * FROM dbo.data1;
SELECT TOP 0 * FROM dbo.data1;

-- Check Total Data
SELECT COUNT(customer_id) AS total_data FROM dbo.data1;

-- Check Table Structure
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='dbo.data1';

-- Show Similar to python head data
SELECT TOP 5 * FROM dbo.data1
ORDER BY customer_id;

-- Find PK by Implement Uniqueness Query
SELECT COUNT(*) AS TotalRows,
       COUNT(DISTINCT order_item_id) AS UniqueOrderItems
FROM dbo.data1;

-- SQL Business Query start Here

-- 01 Which departments generate the highest total sales?
SELECT department_name AS departemnt,SUM(sales) AS total_sales
FROM dbo.data1
GROUP BY department_name
ORDER BY total_sales DESC;

-- 02 Which product categories generate the highest revenue?
SELECT category_name AS product_category,
SUM(sales) AS total_revenue FROM dbo.data1
GROUP BY category_name
ORDER BY total_revenue DESC;

-- 03 Which customer segments contribute the most sales?
SELECT customer_segment,
SUM(sales) AS total_sales_by_segmentation FROM dbo.data1
GROUP BY customer_segment
ORDER BY total_sales_by_segmentation DESC;

-- 04 Which countries place the highest number of orders?
SELECT customer_country AS countries, COUNT(order_item_quantity) AS total_no_of_orders FROM dbo.data1
GROUP BY customer_country
ORDER BY total_no_of_orders DESC;

-- 05 Which shipping modes are used most frequently?
SELECT Shipping_mode,COUNT(shipping_mode) AS most_used_shipping_mode FROM dbo.data1
GROUP BY shipping_mode
ORDER BY most_used_shipping_mode DESC

-- 06 Which products generate the highest profit?
SELECT product_name,SUM(order_profit_per_order) AS product_profit FROM dbo.data1
GROUP BY product_name
ORDER BY product_profit DESC;

-- 07 Which states have the highest late delivery rate?
SELECT TOP 10
    customer_state,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN late_delivery_risk = 1 THEN 1 ELSE 0 END) AS late_orders,
    ROUND(
        100.0 * SUM(CASE WHEN late_delivery_risk = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS late_delivery_rate
FROM dbo.data1
GROUP BY customer_state
ORDER BY late_delivery_rate DESC;

-- 08 Which departments have the highest average order value?
SELECT department_name, AVG(order_item_total) AS average_order_value FROM dbo.data1
GROUP BY department_name
ORDER BY average_order_value DESC;

-- 09 Which customer segments receive the highest discounts?
SELECT customer_segment,SUM(order_item_discount) AS discounts FROM dbo.data1
GROUP BY customer_segment
ORDER BY discounts DESC;

-- 10 What is the monthly sales trend over time?
SELECT YEAR(order_date_dateorders) AS years,MONTH(order_date_dateorders) AS months, 
SUM(sales) AS sales_trend FROM dbo.data1
GROUP BY YEAR(order_date_dateorders),MONTH(order_date_dateorders)
ORDER BY years,months;

-- 11 Which categories have the highest quantity sold?
SELECT category_name AS categories, SUM(order_item_quantity) AS quantity_sold FROM data1
GROUP BY category_name
ORDER BY quantity_sold DESC;

-- 12 Which markets generate high sales but low profit?
SELECT DISTINCT market FROM data1;
SELECT market AS market,SUM(sales) AS sales, SUM(order_profit_per_order) AS profit FROM data1
GROUP BY market
ORDER BY sales DESC,profit ASC;

-- 13 Which shipping modes experience the most delivery delays?
SELECT DISTINCT shipping_mode FROM data1;

SELECT shipping_mode,COUNT(*) AS total_orders,
SUM(CASE WHEN delivery_delay>0 THEN 1 ELSE 0 END) AS delay_orders,
100.0 * SUM(CASE WHEN delivery_delay>0 THEN 1 ELSE 0 END)/count(*) AS delay_percentage
FROM data1 
GROUP BY shipping_mode;

-- 14 Which countries have the highest profit per order?
SELECT order_profit_per_order FROM data1

SELECT customer_country,SUM(order_profit_per_order) AS profit_per_order FROM data1
GROUP BY customer_country
ORDER BY profit_per_order;

-- 15 What percentage of orders are delivered late?
SELECT 100.0 * SUM(CASE WHEN delivery_delay>0 THEN 1 ELSE 0 END)/count(*) AS delay_percentage 
FROM data1;

-- 16 Which products generate high sales but low profit margins?
SELECT product_name,SUM(sales) AS sales, 
100*SUM(order_profit_per_order)/SUM(sales) AS profit FROM data1
GROUP BY product_name
ORDER BY sales DESC,profit ASC;

-- 17 Which departments are most affected by late deliveries?
SELECT department_name,
SUM(CASE WHEN delivery_delay>0 THEN 1 ELSE 0 END) AS late_deliveries_order FROM data1
GROUP BY department_name
ORDER BY late_deliveries_order DESC;

-- 18 Does offering discounts increase profit or only increase sales?
SELECT
   CASE 
     WHEN order_item_discount_rate = 0 THEN 'No Discount'
     ELSE 'Discount' 
     END AS dicount_group,

     SUM(order_profit_per_order) AS total_profit,
     SUM(sales) AS total_sales,

     ROUND(
     (SUM(order_profit_per_order)*100.0)/NULLIF(SUM(sales),0),2) AS profit_margin
     FROM data1
     GROUP BY 
     CASE 
     WHEN order_item_discount_rate = 0 THEN 'No Discount'
     ELSE 'Discount' END;

-- 19 Which customer segments are the most profitable after discounts?
SELECT
   CASE 
     WHEN order_item_discount_rate = 0 THEN 'No Discount'
     ELSE 'Discount' 
     END AS discount_group,
     customer_segment,

     SUM(order_profit_per_order) AS total_profit,
     SUM(sales) AS total_sales,

     ROUND(
     (SUM(order_profit_per_order)*100.0)/NULLIF(SUM(sales),0),2) AS profit_margin,

     FROM data1
   

     GROUP BY 
     customer_segment,
     CASE 
     WHEN order_item_discount_rate = 0 THEN 'No Discount'
     ELSE 'Discount' END
     ORDER BY total_profit DESC ,discount_group ASC;

-- 20 Identify the top 10 customers by lifetime revenue.

SELECT TOP 10 customer_id,customer_fname,customer_lname,
SUM(sales_per_customer) AS lifetime_revnue
FROM data1
GROUP BY customer_id,customer_fname,customer_lname
ORDER BY lifetime_revnue DESC;

-- 21 Which regions have the highest sales growth over time?
SELECT order_region AS region,
YEAR(order_date_dateorders) AS years,
MONTH(order_date_dateorders) AS months,
SUM(sales) AS highest_sales_over_time
FROM data1
GROUP BY YEAR(order_date_dateorders),MONTH(order_date_dateorders),order_region
ORDER BY years ,months,highest_sales_over_time DESC;

-- 22 Which product categories have high demand but poor profitability?
SELECT category_name,
SUM(sales) As high_demand,
SUM(order_profit_per_order) AS poor_profit
FROM data1
GROUP BY category_name
ORDER BY high_demand DESC,poor_profit ASC

-- 23 Which countries generate high sales but also have high delivery risk?
select customer_country,
sum(sales) AS total_sales,
sum(
 CASE
   WHEN
       late_delivery_risk > 0 THEN 1 ELSE 0
   END 
   ) as delivery_risk
FROM data1
GROUP BY customer_country
ORDER BY  total_sales DESC,delivery_risk DESC;

-- 24 Rank products within each category based on total revenue.
SELECT product_name,category_name,
SUM(sales) AS total_revenue,
RANK() OVER(partition BY category_name ORDER BY SUM(sales)) AS ranking_segment
FROM data1
GROUP BY product_name, category_name;

-- 25 Compare scheduled shipping days vs actual shipping days and identify departments with the largest delays.
SELECT 
       department_name,
       avg(days_for_shipment_scheduled) AS shipping_days,
       avg(days_for_shipping_real) AS actual_days,
       SUM(CASE WHEN delivery_delay >0 THEN 1 ELSE 0 END) AS largest_delays
FROM data1 
      GROUP BY department_name
      ORDER BY largest_delays DESC
     


