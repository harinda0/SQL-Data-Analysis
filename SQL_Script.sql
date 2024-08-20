-- Assignment 1: SQL Query for Data Analysis
-- Student: Harinda Uthpala Hewadewa
-- Student ID: 100991731

-- Create Tables
CREATE TABLE order_detail (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    sku_id INT,
    price DECIMAL(10, 2),
    qty_ordered INT,
    before_discount DECIMAL(10, 2),
    discount_amount DECIMAL(10, 2),
    after_discount DECIMAL(10, 2),
    is_gross BOOLEAN,
    is_valid BOOLEAN,
    is_net BOOLEAN,
    payment_id INT
);

CREATE TABLE sku_detail (
    id INT PRIMARY KEY,
    sku_name VARCHAR(50),
    base_price DECIMAL(10, 2),
    cogs DECIMAL(10, 2),
    category VARCHAR(50)
);

CREATE TABLE customer_detail (
    id INT PRIMARY KEY,
    registered_date DATE
);

CREATE TABLE payment_detail (
    id INT PRIMARY KEY,
    payment_method VARCHAR(50)
);

-- Populate Tables with Sample Data
-- order_detail
INSERT INTO order_detail (id, customer_id, order_date, sku_id, price, qty_ordered, before_discount, discount_amount, after_discount, is_gross, is_valid, is_net, payment_id) VALUES
(1, 1, '2021-01-05', 1, 100.00, 2, 200.00, 20.00, 180.00, TRUE, TRUE, FALSE, 1),
(2, 2, '2021-02-10', 2, 150.00, 3, 450.00, 45.00, 405.00, TRUE, TRUE, FALSE, 2),
(3, 3, '2021-03-15', 3, 200.00, 1, 200.00, 20.00, 180.00, TRUE, TRUE, FALSE, 3),
(4, 4, '2021-04-20', 4, 250.00, 2, 500.00, 50.00, 450.00, TRUE, TRUE, FALSE, 4),
(5, 5, '2021-05-25', 5, 300.00, 1, 300.00, 30.00, 270.00, TRUE, TRUE, FALSE, 5),
(6, 6, '2021-06-30', 6, 350.00, 2, 700.00, 70.00, 630.00, TRUE, TRUE, FALSE, 6),
(7, 7, '2021-07-05', 7, 150.00, 3, 450.00, 45.00, 405.00, TRUE, TRUE, FALSE, 7),
(8, 8, '2021-08-10', 8, 200.00, 1, 200.00, 20.00, 180.00, TRUE, TRUE, FALSE, 8),
(9, 9, '2021-09-15', 9, 250.00, 2, 500.00, 50.00, 450.00, TRUE, TRUE, FALSE, 9),
(10, 10, '2021-10-20', 10, 300.00, 1, 300.00, 30.00, 270.00, TRUE, TRUE, FALSE, 10),
(11, 11, '2021-11-25', 11, 100.00, 2, 200.00, 70.00, 350.00, TRUE, TRUE, FALSE, 11),
(12, 12, '2021-12-30', 12, 400.00, 1, 400.00, 40.00, 360.00, TRUE, TRUE, FALSE, 12),
(13, 13, '2022-01-04', 13, 450.00, 2, 900.00, 90.00, 810.00, TRUE, TRUE, FALSE, 13),
(14, 14, '2022-02-09', 14, 500.00, 1, 500.00, 50.00, 450.00, TRUE, TRUE, FALSE, 14),
(15, 15, '2022-03-16', 15, 550.00, 2, 1100.00, 110.00, 990.00, TRUE, TRUE, FALSE, 15),
(16, 16, '2022-04-21', 16, 600.00, 1, 600.00, 60.00, 540.00, TRUE, TRUE, FALSE, 16),
(17, 17, '2022-05-26', 17, 650.00, 2, 1300.00, 130.00, 1170.00, TRUE, TRUE, FALSE, 17),
(18, 18, '2022-06-30', 18, 700.00, 1, 700.00, 70.00, 630.00, TRUE, TRUE, FALSE, 18),
(19, 19, '2022-07-05', 19, 750.00, 2, 1500.00, 150.00, 1350.00, TRUE, TRUE, FALSE, 19),
(20, 20, '2022-08-10', 20, 800.00, 1, 800.00, 80.00, 720.00, TRUE, TRUE, FALSE, 20);

-- sku_detail
INSERT INTO sku_detail (id, sku_name, base_price, cogs, category) VALUES
(1, 'Samsung', 100.00, 90.00, 'Electronics'),
(2, 'Apple', 250.00, 225.00, 'Electronics'),
(3, 'Sony', 400.00, 360.00, 'Electronics'),
(4, 'Huawei', 550.00, 495.00, 'Electronics'),
(5, 'Lenovo', 700.00, 630.00, 'Electronics'),
(6, 'Chanel Perfume', 350.00, 315.00, 'Clothing'),
(7, 'Gucci Wallet', 450.00, 405.00, 'Clothing'),
(8, 'Versace Shirt', 600.00, 540.00, 'Clothing'),
(9, 'Armani Jeans', 750.00, 675.00, 'Clothing'),
(10, 'Prada Shoes', 850.00, 765.00, 'Clothing'),
(11, 'IKEA Chair', 150.00, 135.00, 'Home Goods'),
(12, 'Dyson Vacuum', 200.00, 180.00, 'Home Goods'),
(13, 'Tefal Cookware Set', 300.00, 270.00, 'Home Goods'),
(14, 'Philips Hue Bulbs', 500.00, 450.00, 'Home Goods'),
(15, 'KitchenAid Mixer', 650.00, 585.00, 'Home Goods'),
(16, 'Ray-Ban Sunglasses', 800.00, 720.00, 'Clothing'),
(17, 'Timberland Boots', 950.00, 855.00, 'Clothing'),
(18, 'Bose Headphones', 1000.00, 900.00, 'Electronics'),
(19, 'Apple', 1050.00, 945.00, 'Electronics'),
(20, 'Samsung', 1100.00, 990.00, 'Electronics');

-- customer_detail
INSERT INTO customer_detail (id, registered_date) VALUES
(1, '2020-01-01'),
(2, '2020-02-02'),
(3, '2020-03-03'),
(4, '2020-04-04'),
(5, '2020-05-05'),
(6, '2020-06-06'),
(7, '2020-07-07'),
(8, '2020-08-08'),
(9, '2020-09-09'),
(10, '2020-10-10'),
(11, '2020-11-11'),
(12, '2020-12-12'),
(13, '2021-01-01'),
(14, '2021-02-02'),
(15, '2021-03-03'),
(16, '2021-04-04'),
(17, '2021-05-05'),
(18, '2021-06-06'),
(19, '2021-07-07'),
(20, '2021-08-08');

-- payment_detail
INSERT INTO payment_detail (id, payment_method) VALUES
(1, 'Credit Card'),
(2, 'Debit Card'),
(3, 'PayPal'),
(4, 'Bank Transfer'),
(5, 'Cash'),
(6, 'Mobile Payment'),
(7, 'Credit Card'),
(8, 'Debit Card'),
(9, 'PayPal'),
(10, 'Bank Transfer'),
(11, 'Cash'),
(12, 'Mobile Payment'),
(13, 'Credit Card'),
(14, 'Debit Card'),
(15, 'PayPal'),
(16, 'Bank Transfer'),
(17, 'Cash'),
(18, 'Mobile Payment'),
(19, 'Credit Card'),
(20, 'Debit Card');

-- SQL Queries

-- Question 1: Highest Transaction Value Month in 2021
-- This query finds the month with the highest total transaction value (after_discount) in 2021.
SELECT 
    LPAD(MONTH(order_date), 2, '0') AS month_id, 
    MONTHNAME(order_date) AS month, 
    YEAR(order_date) AS year, 
    SUM(after_discount) AS total_transaction
FROM order_detail
WHERE YEAR(order_date) = 2021 AND is_valid = 1
GROUP BY month_id, month, year
ORDER BY total_transaction DESC
LIMIT 1;

-- Question 2: Highest Transaction Value Category in 2022
-- This query finds the category with the highest total transaction value in 2022.
SELECT YEAR(order_detail.order_date) AS year, 
       sku_detail.category, 
       SUM(order_detail.after_discount) AS total_transaction
FROM order_detail
JOIN sku_detail ON order_detail.sku_id = sku_detail.id
WHERE YEAR(order_detail.order_date) = 2022 AND order_detail.is_valid = 1
GROUP BY sku_detail.category, year
ORDER BY total_transaction DESC
LIMIT 1;

-- Question 3: Comparison of Transaction Values by Category in 2021 and 2022
-- This query compares transaction values of each category in 2021 and 2022 and adds remarks.
SELECT sku_detail.category,
    SUM(CASE WHEN YEAR(order_detail.order_date) = 2021 THEN order_detail.after_discount ELSE 0 END) AS transaction_2021,
    SUM(CASE WHEN YEAR(order_detail.order_date) = 2022 THEN order_detail.after_discount ELSE 0 END) AS transaction_2022,
    SUM(CASE WHEN YEAR(order_detail.order_date) = 2022 THEN order_detail.after_discount ELSE 0 END) -
    SUM(CASE WHEN YEAR(order_detail.order_date) = 2021 THEN order_detail.after_discount ELSE 0 END) AS delta,
    CASE
        WHEN SUM(CASE WHEN YEAR(order_detail.order_date) = 2022 THEN order_detail.after_discount ELSE 0 END) > SUM(CASE WHEN YEAR(order_detail.order_date) = 2021 THEN order_detail.after_discount ELSE 0 END)
        THEN 'INCREASE'
        WHEN SUM(CASE WHEN YEAR(order_detail.order_date) = 2022 THEN order_detail.after_discount ELSE 0 END) < SUM(CASE WHEN YEAR(order_detail.order_date) = 2021 THEN order_detail.after_discount ELSE 0 END)
        THEN 'DECREASE'
        ELSE 'NO CHANGE'
    END AS remark
FROM order_detail
JOIN sku_detail ON order_detail.sku_id = sku_detail.id
WHERE order_detail.is_valid = 1
GROUP BY sku_detail.category;

-- Question 4: Top 5 Payment Methods in 2022
-- This query finds the top 5 most popular payment methods based on frequency in 2022.
SELECT payment_detail.payment_method, 
       YEAR(order_detail.order_date) AS to_char, 
       COUNT(*) AS freq
FROM order_detail
JOIN payment_detail ON order_detail.payment_id = payment_detail.id
WHERE YEAR(order_detail.order_date) = 2022 AND order_detail.is_valid = 1
GROUP BY payment_detail.payment_method, to_char
ORDER BY freq DESC
LIMIT 5;

-- Question 5: Sort Products by Transaction Value
-- This query sorts the specified products based on their transaction values.
SELECT sku_detail.sku_name AS product_brand, 
       SUM(order_detail.after_discount) AS total_transaction
FROM order_detail
JOIN sku_detail ON order_detail.sku_id = sku_detail.id
WHERE sku_detail.sku_name IN ('Samsung', 'Apple', 'Sony', 'Huawei', 'Lenovo') AND order_detail.is_valid = 1
GROUP BY sku_detail.sku_name
ORDER BY total_transaction DESC;
