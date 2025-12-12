# Ford Motor Company — SQL Analytics Project

## Project Overview
This project demonstrates SQL querying and analytical skills using a simulated automotive parts sales database inspired by Ford Motor Company operations.

The goal is to extract business insights related to customers, orders, revenue, and product performance using structured SQL queries.

---

## Tools & Technologies
- SQL (SQLite)
- Terminal
- Git & GitHub

---

## Database Structure
The database consists of the following tables:
- customers
- orders
- order_items
- products

---

## Relationships:
- Customers → Orders (1-to-many)
- Orders → Order Items (1-to-many)
- Products → Order Items (1-to-many)

---

## Key Business Questions Answered
1. How many unique customers placed orders?
2. What is the total revenue generated?
3. What is the average order value?
4. Which customers generate the highest revenue?
5. How does revenue trend over time?
6. What are the top-selling parts?
7. How many orders does each customer place?

---

## Key Insights
- Revenue is concentrated among a small group of high-value customers
- Certain automotive parts contribute disproportionately to total sales
- Monthly revenue trends help identify peak demand periods
- Repeat customers drive a significant share of revenue

---

## Repository Structure
├── queries/ # SQL queries answering business questions
├── outputs/ # Query results exported as CSV files
├── ford_sql.db # SQLite database
└── README.md

---

Disclaimer!

This project uses simulated data created solely for portfolio purposes.
It does not contain proprietary or confidential Ford Motor Company data.
