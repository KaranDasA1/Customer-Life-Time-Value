USE customer_lifetime_value;

/*
 STEP 1: TOTAL REVENUE PER CUSTOMER 
*/
SELECT 
    c.customer_id,
    c.name,
    SUM(o.order_amount) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_revenue DESC;

/*
 STEP 2: AVERAGE ORDER VALUE (AOV)
 Formula: AOV = Total Revenue / Number of Orders
*/
SELECT 
    c.customer_id,
    c.name,
    SUM(o.order_amount) / COUNT(o.order_id) AS average_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY average_order_value DESC;

/*
 STEP 3: PURCHASE FREQUENCY
 Number of orders placed by each customer
*/
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS purchase_frequency
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY purchase_frequency DESC;

/*
 STEP 4: CUSTOMER LIFESPAN (DAYS)
 Lifespan = Last Order Date – First Order Date
*/
SELECT
    c.customer_id,
    c.name,
    MIN(o.order_date) AS first_purchase,
    MAX(o.order_date) AS last_purchase,
    DATEDIFF(MAX(o.order_date), MIN(o.order_date)) AS lifespan_days
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY lifespan_days DESC;

/*
 STEP 5: PAYMENT VALIDATION CHECK
 Ensures order amounts match total payments received (Data Quality)
*/
SELECT 
    o.order_id,
    o.order_amount,
    IFNULL(SUM(p.payment_amount), 0) AS total_paid,
    (o.order_amount - IFNULL(SUM(p.payment_amount), 0)) AS balance_due
FROM orders o
LEFT JOIN payments p ON o.order_id = p.order_id
GROUP BY o.order_id, o.order_amount
HAVING balance_due <> 0
ORDER BY balance_due DESC;

/*
 STEP 6: FINAL CUSTOMER LIFETIME VALUE (CLTV)
 CLTV Formula Used:
     CLTV = AOV × Purchase Frequency × Customer Lifespan (months)*/
SELECT
    c.customer_id,
    c.name,
    SUM(o.order_amount) AS total_revenue,
    SUM(o.order_amount) / COUNT(o.order_id) AS average_order_value,
    COUNT(o.order_id) AS purchase_frequency,
    DATEDIFF(MAX(o.order_date), MIN(o.order_date)) AS lifespan_days,
    (DATEDIFF(MAX(o.order_date), MIN(o.order_date)) / 30) AS lifespan_months,
    (SUM(o.order_amount) / COUNT(o.order_id)) * COUNT(o.order_id) * (DATEDIFF(MAX(o.order_date), MIN(o.order_date)) / 30) AS CLTV


FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY CLTV DESC;
