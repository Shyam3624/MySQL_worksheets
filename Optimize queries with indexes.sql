#1. Index on Foreign Keys for Faster JOINs
CREATE INDEX idx_orders_customer_id ON Orders(customer_id);
CREATE INDEX idx_orderdetails_order_id ON OrderDetails(order_id);
CREATE INDEX idx_orderdetails_product_id ON OrderDetails(product_id);

#2. Index on Frequently Filtered Columns (WHERE clauses)
CREATE INDEX idx_orders_order_date ON Orders(order_date);
CREATE INDEX idx_products_category ON Products(category);

#3. Composite Index on Multiple Columns Used Together
CREATE INDEX idx_orders_customer_date ON Orders(customer_id, order_date);

#4. Index for LIKE searches or pattern filters
CREATE INDEX idx_customers_name ON Customers(name);


#5. Covering Index: All columns in SELECT + WHERE
SELECT product_id, price 
FROM Products 
WHERE category = 'Electronics';

#Create:
CREATE INDEX idx_products_category_price ON Products(category, price);