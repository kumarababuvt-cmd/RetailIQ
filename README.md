# 🛍️ RetailIQ

### End-to-End Retail Analytics Project using Python, MySQL, SQL, Jupyter Notebook & Power BI

RetailIQ is an end-to-end retail analytics portfolio project that simulates a realistic electronics retail business. The project follows a complete analytics workflow — from synthetic data generation and relational database design to SQL analysis, data validation, DAX calculations, and interactive Power BI dashboards.

The project models customers, products, suppliers, warehouses, stores, inventory, orders, payments, and returns to support practical retail business analysis.

---

## 📖 Overview

RetailIQ was built to demonstrate how a Data Analyst can work across the complete analytics lifecycle:

```text
Python
   ↓
Synthetic Data Generation
   ↓
CSV Datasets
   ↓
MySQL Database
   ↓
SQL Validation & Analysis
   ↓
Advanced SQL
   ↓
Power BI Data Model
   ↓
DAX Measures
   ↓
5-Page Interactive Dashboard
```

Rather than focusing on a single tool, the project brings together data generation, database design, SQL analysis, analytical calculations, and business intelligence.

---

## 🎯 Project Objectives

- Generate realistic synthetic retail data using Python and Pandas.
- Design a normalized relational database using MySQL.
- Maintain data integrity using Primary Keys, Foreign Keys, and constraints.
- Validate the generated data and database relationships.
- Perform business-focused SQL analysis.
- Apply advanced SQL techniques such as CTEs and window functions.
- Build a Power BI data model for interactive analysis.
- Create DAX measures for KPIs, rankings, customer analysis, inventory analysis, and time intelligence.
- Develop a five-page Power BI dashboard for retail decision support.
- Present the project as an end-to-end Data Analyst portfolio case study.

---

## 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| **Python** | Synthetic Data Generation |
| **Pandas** | Data Processing & CSV Generation |
| **MySQL** | Relational Database Management |
| **SQL** | Data Validation, Business Analysis & Advanced Analytics |
| **Power BI** | Data Modeling, DAX & Interactive Dashboarding |

---

## 🗄️ Database Overview

RetailIQ consists of **13 interconnected tables** designed using relational database and normalization principles.

### Master Tables

1. Category
2. Supplier
3. Warehouse
4. Store
5. Customer
6. Employee
7. Product

### Transaction Tables

8. Orders
9. Order Items
10. Payments
11. Returns

### Inventory Tables

12. Warehouse Inventory
13. Store Inventory

The database uses Primary Keys, Foreign Keys, constraints, and relationships between business entities to represent a connected retail environment.

---

## 📊 Dataset Statistics

| Metric | Value |
|--------|------:|
| Total Tables | 13 |
| Categories | 12 |
| Suppliers | 41 |
| Warehouses | 10 |
| Stores | 50 |
| Customers | 1,000 |
| Employees | 250 |
| Products | 500 |
| Orders | 5,000 |
| Order Items | 15,032 |
| Payments | 5,000 |
| Returns | 250 |
| Warehouse Inventory Records | 5,000 |
| Store Inventory Records | 25,000 |

> **Note:** RetailIQ uses synthetically generated data for portfolio and analytical practice purposes.

---

# 📊 Power BI Dashboard

RetailIQ contains **five analytical dashboard pages**, each designed around a different business perspective.

## 1. Executive Overview

Provides a high-level view of overall business performance.

**Focus areas:**
- Total Revenue
- Total Profit
- Total Orders
- Revenue Trends
- Profit Trends
- Top Stores / Products
- Revenue by Category

---

## 2. Customer Intelligence

Focuses on customer activity, customer value, repeat behavior, and customer growth.

**Focus areas:**
- Customer volume
- Revenue per Customer
- Orders per Customer
- Customer growth
- Returning Customers
- Repeat Customer Rate
- Customer behavior analysis

---

## 3. Product Performance

Analyzes product and category-level performance.

**Focus areas:**
- Total Products
- Product Revenue
- Product Profit
- Profit Margin
- Top Products by Revenue
- Top Products by Profit
- Revenue by Product Category
- Profit Margin by Product Category

---

## 4. Store & Inventory

Focuses on current store and warehouse inventory distribution.

**Focus areas:**
- Total Stores
- Total Store Inventory
- Stock Availability
- Out-of-Stock Products
- Top Stores by Inventory
- Top Warehouses by Inventory
- Inventory Distribution by Category
- Product Inventory

> Historical inventory trend analysis is intentionally not presented where the underlying inventory data does not contain a meaningful historical inventory date.

---

## 5. Trends & Time Intelligence

Analyzes how key business metrics change over time.

**Focus areas:**
- Revenue & Orders Trend
- Customer Trend
- Average Order Value Trend
- Revenue YoY Growth
- Monthly business performance

---
## 📊 Power BI Dashboard Preview

### Executive Overview
![Executive Overview](screenshots/executive_overview.png)

### Customer Intelligence
![Customer Intelligence](screenshots/customer_intelligence.png)

### Product Performance
![Product Performance](screenshots/product_performance.png)

### Store & Inventory
![Store & Inventory](screenshots/store_inventory.png)

### Trends & Time Intelligence
![Trends & Time Intelligence](screenshots/trends_time_intelligence.png)

## 🔍 Key Business Questions

RetailIQ was designed around practical business questions rather than only technical exercises.

### 💰 Sales & Revenue

- How is revenue changing over time?
- Which stores contribute the most revenue?
- Which products generate the highest revenue?
- How does revenue compare with the previous year?
- What is the average value of an order?

### 👥 Customer Intelligence

- How many customers are being registered over time?
- How much revenue is generated per customer?
- How frequently do customers place orders?
- Which customers return to purchase again?
- How is the customer base changing over time?

### 📦 Product Performance

- Which products generate the most revenue?
- Which products contribute to profitability?
- How does performance differ across product categories?
- Which categories have stronger or weaker profit margins?

### 🏬 Store & Inventory

- Which stores hold the most inventory?
- Which warehouses hold the most inventory?
- How is inventory distributed across categories?
- Which products are unavailable or out of stock?

### 📅 Time & Trend Analysis

- How do revenue and orders change month by month?
- How does Average Order Value change over time?
- How is revenue growing year over year?
- How does customer registration change over time?

---

## 🧮 DAX & Power BI Analysis

The Power BI model uses DAX measures to support interactive business analysis.

The model includes measures covering areas such as:

- Revenue
- Orders
- Quantity
- Customers
- Products
- Cost
- Profit
- Profit Margin
- Average Order Value
- Revenue per Customer
- Customer Order Frequency
- Returns
- Store Rankings
- Product Rankings
- Year-to-Date / Month-to-Date / Quarter-to-Date analysis
- Previous Year calculations
- Year-over-Year growth
- Customer repeat behavior
- Inventory KPIs

The dashboard uses relationships, filter context, calculated measures, and time-intelligence techniques to allow users to explore the business interactively.

---

## 🧪 SQL Analysis

The SQL work is organized into four dedicated files.

### `schema.sql`

Contains the database structure, including:

- Table creation
- Primary Keys
- Foreign Keys
- Constraints
- Relational structure

### `validation_queries.sql`

Contains queries used to validate:

- Data quality
- Missing values
- Duplicate records
- Relationships
- Referential integrity
- Generated data consistency

### `business_queries.sql`

Contains business-focused analysis covering areas such as:

- Sales
- Customers
- Products
- Stores
- Inventory
- Suppliers
- Employees
- Payments
- Returns

### `advanced_queries.sql`

Contains advanced analytical SQL using techniques such as:

- Common Table Expressions (CTEs)
- Window Functions
- Ranking
- Partitioning
- Analytical aggregations

These queries are designed to translate business questions into analytical outputs.

---

## 🐍 Python Data Generation

Python was used to generate the synthetic RetailIQ datasets.

The generator scripts are separated by business entity, making the data-generation workflow easier to understand and maintain.

Examples include:

- `category_generator.py`
- `supplier_generator.py`
- `warehouse_generator.py`
- `warehouse_inventory_generator.py`
- `store_generator.py`
- `store_inventory_generator.py`
- `customer_generator.py`
- `employee_generator.py`
- `product_generator.py`
- `orders_generator.py`
- `order_items_generator.py`
- `payments_generator.py`
- `returns_generator.py`

The generated datasets are stored as CSV files and used as the source data for the MySQL and Power BI workflow.

---


## 📁 Project Structure

```text
RetailIQ/
│
├── .vscode/
│
├── csv/
│   ├── category.csv
│   ├── supplier.csv
│   ├── warehouse.csv
│   ├── warehouse_inventory.csv
│   ├── store.csv
│   ├── store_inventory.csv
│   ├── customer.csv
│   ├── employee.csv
│   ├── product.csv
│   ├── orders.csv
│   ├── order_items.csv
│   ├── payments.csv
│   └── returns.csv
│
├── documentation/
│
|
│
│
├── powerbi/
│   └── RetailIQ.pbix
│
├── python/
│   ├── category_generator.py
│   ├── supplier_generator.py
│   ├── warehouse_generator.py
│   ├── warehouse_inventory_generator.py
│   ├── store_generator.py
│   ├── store_inventory_generator.py
│   ├── customer_generator.py
│   ├── employee_generator.py
│   ├── product_generator.py
│   ├── orders_generator.py
│   ├── order_items_generator.py
│   ├── payments_generator.py
│   └── returns_generator.py
│
├── sql/
│   ├── schema.sql
│   ├── validation_queries.sql
│   ├── business_queries.sql
│   └── advanced_queries.sql
│
└── README.md
```

---

## ⭐ Key Features

- Realistic synthetic electronics retail dataset
- 13 interconnected relational tables
- Normalized database structure
- Primary Key and Foreign Key relationships
- Data integrity constraints
- Customer order management
- Product and category analysis
- Store and warehouse inventory analysis
- Payment tracking
- Product return management
- Business-focused SQL analysis
- Advanced SQL analysis
- Power BI data modeling
- DAX-based KPIs
- Time-intelligence analysis
- Five-page interactive Power BI dashboard

---

## 📈 Project Status

| Component | Status |
|-----------|--------|
| Database Schema | ✅ Completed |
| Python Data Generators | ✅ Completed |
| Synthetic Dataset | ✅ Generated |
| MySQL Database | ✅ Completed |
| Data Validation | ✅ Completed |
| Business SQL Analysis | ✅ Completed |
| Advanced SQL Analysis | ✅ Completed |
| Power BI Data Model | ✅ Completed |
| DAX Measures | ✅ Completed |
| Executive Overview | ✅ Completed |
| Customer Intelligence | ✅ Completed |
| Product Performance | ✅ Completed |
| Store & Inventory | ✅ Completed |
| Trends & Time Intelligence | ✅ Completed |
| Portfolio Packaging | 🚀 In Progress |

---

## 💡 What This Project Demonstrates

RetailIQ demonstrates an end-to-end Data Analyst workflow across multiple stages:

```text
Data Generation
       ↓
Data Preparation
       ↓
Database Design
       ↓
Data Validation
       ↓
SQL Analysis
       ↓
Advanced Analytics
       ↓
Data Modeling
       ↓
DAX
       ↓
Business Intelligence
       ↓
Dashboard Storytelling
```

The project demonstrates practical skills in:

- Data preparation
- Relational database design
- SQL querying
- Data validation
- Business problem solving
- Analytical calculations
- DAX
- Power BI data modeling
- Dashboard design
- Communicating business insights

---

## 🚀 How to Explore the Project

### 1. Explore the Python folder

Review the scripts used to generate the synthetic retail datasets.

### 2. Explore the CSV folder

Inspect the generated datasets for the different retail entities.

### 3. Explore the SQL folder

Start with:

```text
schema.sql
```

Then review:

```text
validation_queries.sql
business_queries.sql
advanced_queries.sql
```

### 4. Explore the Power BI dashboard

Open the `.pbix` file in Power BI Desktop to explore the five dashboard pages and interactive analysis.

---

## 👨‍💻 Author

**Kumara Babu**

MCA Student | Aspiring Data Analyst

---

## 📌 Project Note

RetailIQ uses synthetic data created specifically for analytics practice and portfolio demonstration. The project is intended to showcase the technical workflow, analytical implementation, and business-oriented thinking involved in an end-to-end Data Analyst project.
