USE customer_lifetime_value;
CREATE TABLE payments(
payment_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
payment_date DATE,
payment_amount DECIMAL(10, 2),
FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
