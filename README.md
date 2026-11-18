# E-commerce Database Project – Online Cosmetics Store

A relational database project developed using Oracle SQL and Oracle SQL Developer, designed to manage products, categories, customers, orders, and order details for an online cosmetics store.

## Technologies Used

- Oracle Database
- Oracle SQL Developer
- SQL / PL/SQL-compatible Oracle SQL syntax

## Database Structure

The database consists of five interconnected tables:

- **Categories:** Stores product categories using a hierarchical structure.
- **Products:** Stores product information, including brand, price, stock, and category.
- **Customers:** Stores customer information.
- **Orders:** Manages customer orders and their statuses.
- **Order Details:** Stores ordered products, quantities, and unit prices.

## Implemented Features

- Relational database design with primary and foreign keys
- Hierarchical product categories using self-referencing relationships
- Data insertion and management
- Complex SQL queries using JOINs and correlated subqueries
- Data aggregation using GROUP BY and HAVING
- Hierarchical queries using CONNECT BY PRIOR and SYS_CONNECT_BY_PATH
- Analytical queries using window functions

## SQL Query Examples

The project includes queries for:

- Displaying product category hierarchies
- Calculating customer spending and purchase quantities
- Identifying products priced above the overall average
- Analyzing sales by product category
- Ranking products by price within categories
- Comparing consecutive product prices using LAG()
- Calculating cumulative prices using SUM() OVER()
- Comparing product prices within their categories

## Project Purpose

This project was developed to apply advanced Oracle SQL concepts to a practical e-commerce database scenario, focusing on relational database design, hierarchical data, complex querying, and analytical functions.

## Development Environment

All SQL scripts were developed and executed using Oracle SQL Developer.
