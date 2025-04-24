#1. Total Sales per Product
SELECT 
    p.product_name,
    SUM(od.quantity * od.price) AS total_sales
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_sales DESC;


#2. Average Order Value Per Customer
SELECT 
    c.name AS customer_name,
    AVG(o.total_amount) AS average_order_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY average_order_value DESC;

#3. Total Quantity Sold by Category
SELECT 
    category,
    SUM(od.quantity) AS total_units_sold
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY category
ORDER BY total_units_sold DESC;


#4. Monthly Average Order Value
SELECT 
    MONTH(order_date) AS order_month,
    AVG(total_amount) AS avg_order_value
FROM Orders
GROUP BY MONTH(order_date)
ORDER BY order_month;


#5. Top 5 Customers by Total Spend
SELECT 
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 5;


#6. Average Product Price Per Category
SELECT 
    category,
    AVG(price) AS avg_price
FROM Products
GROUP BY category
ORDER BY avg_price DESC;