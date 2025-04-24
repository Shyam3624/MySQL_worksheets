#1. Most Loyal Cities----Find cities with the highest number of repeat customers (customers with more than 1 order).
SELECT 
    c.city,
    COUNT(DISTINCT o.customer_id) AS repeat_customers
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.city, o.customer_id
HAVING COUNT(o.order_id) > 1
ORDER BY repeat_customers DESC;

#2.Top Selling Products by Quantity----Products that have been sold the most units.
SELECT 
    p.product_name,
    SUM(od.quantity) AS total_units_sold
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_units_sold DESC;


#3.Monthly Order Count----Number of orders placed in each month.
SELECT 
    MONTH(order_date) AS order_month,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY MONTH(order_date)
ORDER BY order_month;


#4.High-Value Orders----Orders where the total amount exceeds ₹25,000.
SELECT 
    order_id,
    customer_id,
    total_amount
FROM Orders
WHERE total_amount > 25000
ORDER BY total_amount DESC;


#5.Product Sales by Category-----Total quantity of products sold in each category.
SELECT 
    p.category,
    SUM(od.quantity) AS total_quantity_sold
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.category
ORDER BY total_quantity_sold DESC;


#6.Customer Order Count----Number of orders placed by each customer.
SELECT 
    c.name,
    COUNT(o.order_id) AS orders_placed
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY orders_placed DESC;


#7. New vs. Old Customers---Segment customers based on registration before/after a given date.
SELECT 
    CASE 
        WHEN registered_date < '2024-03-01' THEN 'Old Customer'
        ELSE 'New Customer'
    END AS customer_type,
    COUNT(*) AS total_customers
FROM Customers
GROUP BY customer_type
ORDER BY total_customers DESC;




