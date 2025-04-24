#1. Customers Who Placed Orders Above the Average Order Amount
SELECT 
    customer_id,
    order_id,
    total_amount
FROM Orders
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM Orders
)
ORDER BY total_amount DESC;



#2. Products That Have Sold More Than the Average Quantity
SELECT 
    product_id,
    SUM(quantity) AS total_quantity
FROM OrderDetails
GROUP BY product_id
HAVING total_quantity > (
    SELECT AVG(total_qty)
    FROM (
        SELECT SUM(quantity) AS total_qty
        FROM OrderDetails
        GROUP BY product_id
    ) AS avg_table
)
ORDER BY total_quantity DESC;


#3. Customers Who Ordered the Most Expensive Product
SELECT name, customer_id
FROM Customers
WHERE customer_id IN (
    SELECT o.customer_id
    FROM Orders o
    JOIN OrderDetails od ON o.order_id = od.order_id
    WHERE od.product_id = (
        SELECT product_id
        FROM Products
        ORDER BY price DESC
        LIMIT 1
    )
);


#4. List Products Priced Higher Than All Products in a Certain Category (e.g., ‘Books’)
SELECT product_name, price
FROM Products
WHERE price > ALL (
    SELECT price
    FROM Products
    WHERE category = 'Books'
)
ORDER BY price DESC;


#5. Orders That Include the Product with the Highest Stock
SELECT DISTINCT o.order_id, c.name
FROM Orders o
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Customers c ON o.customer_id = c.customer_id
WHERE od.product_id = (
    SELECT product_id
    FROM Products
    ORDER BY stock_quantity DESC
    LIMIT 1
);
