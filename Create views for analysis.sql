#1. View: Total Sales Per Product
CREATE VIEW view_total_sales_per_product AS
SELECT 
    p.product_id,
    p.product_name,
    SUM(od.quantity * od.price) AS total_sales
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_id;


#2. View: Customer Spending Summary
CREATE VIEW view_customer_spending AS
SELECT 
    c.customer_id,
    c.name AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent,
    AVG(o.total_amount) AS avg_order_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;



#3. View: Top-Selling Categories
CREATE VIEW view_category_sales AS
SELECT 
    p.category,
    SUM(od.quantity) AS total_quantity_sold,
    SUM(od.quantity * od.price) AS total_revenue
FROM Products p
JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY p.category;



# 4. View: Monthly Revenue Trend
CREATE VIEW view_monthly_revenue AS
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    SUM(total_amount) AS monthly_revenue
FROM Orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY order_month;


#5. View: Unsold Products
CREATE VIEW view_unsold_products AS
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    p.price
FROM Products p
LEFT JOIN OrderDetails od ON p.product_id = od.product_id
WHERE od.product_id IS NULL;



# 6. View: High-Value Orders (Over ₹5000)
CREATE VIEW view_high_value_orders AS
SELECT 
    o.order_id,
    c.name AS customer_name,
    o.total_amount,
    o.order_date
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.total_amount > 5000
ORDER BY o.total_amount DESC;