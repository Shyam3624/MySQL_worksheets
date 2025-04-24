#inserting values into Customer datbase
INSERT INTO Customers (name, email, city, registered_date) VALUES
('Anil Kumar', 'anil@example.com', 'Hyderabad', '2024-01-15'),
('Sneha Reddy', 'sneha@example.com', 'Chennai', '2024-02-10'),
('Ravi Teja', 'ravi@example.com', 'Bangalore', '2024-03-05');

#inserting values into Products datbase
INSERT INTO Products (product_name, category, price, stock_quantity) VALUES
('Laptop', 'Electronics', 55000.00, 10),
('Headphones', 'Accessories', 1500.00, 50),
('Mobile Phone', 'Electronics', 20000.00, 20),
('T-Shirt', 'Apparel', 500.00, 100);

#inserting values into Orders datbase
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2024-04-01', 56500.00),
(2, '2024-04-02', 21500.00),
(3, '2024-04-05', 2000.00);

#inserting values into OrderDetails datbase
INSERT INTO OrderDetails (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 55000.00),
(1, 2, 1, 1500.00),
(2, 3, 1, 20000.00),
(2, 2, 1, 1500.00),
(3, 2, 1, 1500.00),
(3, 4, 1, 500.00);
