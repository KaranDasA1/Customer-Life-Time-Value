USE customer_lifetime_value;
CREATE TABLE orders(
order_id INT AUTO_INCREMENT PRIMARY KEY,
order_date DATE,
customer_id INT,
order_amount DECIMAL (10,2),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);