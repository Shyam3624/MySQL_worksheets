#1. INNER JOIN
#Query: Show complete order details with customer name, product name, quantity, and price
SELECT 
    o.order_id,
    c.name AS customer_name,
    p.product_name,
    od.quantity,
    od.price
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN OrderDetails od ON o.order_id = od.order_id
INNER JOIN Products p ON od.product_id = p.product_id
ORDER BY o.order_id;


#2. LEFT JOIN
#Query: Show all customers and their order count (including those with 0 orders)
SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_orders DESC;


#3. RIGHT JOIN
#Query: Show all products and how many times they were ordered (even if not ordered)
SELECT 
    p.product_id,
    p.product_name,
    SUM(od.quantity) AS times_ordered
FROM Products p
RIGHT JOIN OrderDetails od ON p.product_id = od.product_id
GROUP BY p.product_id
ORDER BY times_ordered DESC;