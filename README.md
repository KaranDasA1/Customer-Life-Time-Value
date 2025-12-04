# Customer-Life-Time-Value
SQL project to calculate Customer Lifetime Value (CLTV) with sample schema and queries
# Customer Lifetime Value (CLTV) – SQL Project

This project calculates **Customer Lifetime Value (CLTV)** using SQL.  
It includes creating tables, inserting sample data, checking payment consistency,  
and running analysis queries such as total revenue, average order value, and payment verification.

---

## Files in This Repository

- **insert_customers.sql** – Inserts sample customer data  
- **insert_orders.sql** – Inserts sample order/order amount data  
- **insert_payments.sql** – Inserts payment data (including partial payments)  
- **customer_cltv.sql** – Queries for CLTV-related analysis  
- **order_cltv.sql** – Order-based analysis queries  
- **payments_cltv.sql** – Payment consistency checks  
- **Analysis File.sql** – Additional combined or exploratory SQL queries  

---

## 🗄️ Database Tables Used

### **customers**
| Column        | Description         |
|---------------|---------------------|
| customer_id   | Unique customer ID  |
| name          | Customer name       |
| join_date     | Date they joined    |

### **orders**
| Column        | Description              |
|---------------|--------------------------|
| order_id      | Unique order ID          |
| order_date    | Date of order            |
| customer_id   | Linked customer ID       |
| order_amount  | Total order amount       |

### **payments**
| Column        | Description                     |
|---------------|---------------------------------|
| payment_id    | Unique payment ID               |
| order_id      | Linked order ID                 |
| payment_date  | Date payment was made           |
| payment_amount| Amount paid (supports partials) |

---

## 🔍 Key SQL Concepts Used

- `JOIN`
- `LEFT JOIN`
- `GROUP BY`
- `SUM()`, `COUNT()`, `AVG()`
- `HAVING`
- `IFNULL()`

---

## 📊 Analysis Performed

- Total revenue per customer  
- Average order value (AOV)  
- Payment verification (check if orders are fully paid)  
- Basic CLTV components (AOV, frequency, revenue)  

---

