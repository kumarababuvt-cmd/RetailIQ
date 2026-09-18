/*
========================================================
RETAILIQ DATABASE VALIDATION QUERIES
========================================================
Author      : Kumara Babu
Database    : RetailIQ
Description :
This file contains SQL queries used to validate the
accuracy, consistency, and integrity of the RetailIQ
database before performing business analysis.
========================================================
*/

USE retailiq;

/*
========================================================
1. ROW COUNT VALIDATION
========================================================
Purpose:
Verify that all tables contain the expected number of
records after data import.
========================================================
*/

SELECT 'Category' AS Table_Name, COUNT(*) AS Total_Records
FROM category

UNION ALL

SELECT 'Supplier', COUNT(*)
FROM supplier

UNION ALL

SELECT 'Warehouse', COUNT(*)
FROM warehouse

UNION ALL

SELECT 'Warehouse Inventory', COUNT(*)
FROM warehouse_inventory

UNION ALL

SELECT 'Store', COUNT(*)
FROM store

UNION ALL

SELECT 'Store Inventory', COUNT(*)
FROM store_inventory

UNION ALL

SELECT 'Customer', COUNT(*)
FROM customer

UNION ALL

SELECT 'Employee', COUNT(*)
FROM employee

UNION ALL

SELECT 'Product', COUNT(*)
FROM product

UNION ALL

SELECT 'Orders', COUNT(*)
FROM orders

UNION ALL

SELECT 'Order Items', COUNT(*)
FROM order_items

UNION ALL

SELECT 'Payments', COUNT(*)
FROM payments

UNION ALL

SELECT 'Returns', COUNT(*)
FROM returns;

/*
========================================================
2. NULL VALUE VALIDATION
========================================================
Purpose:
Verify that all mandatory columns contain valid values.
Expected Result:
Every query should return 0 rows.
========================================================
*/

-- CATEGORY TABLE

SELECT *
FROM category
WHERE category_id IS NULL
   OR category_name IS NULL
   OR status IS NULL;


-- SUPPLIER TABLE

SELECT *
FROM supplier
WHERE supplier_id IS NULL
   OR supplier_name IS NULL
   OR product_quality IS NULL
   OR correct_time_delivery_rating IS NULL
   OR total_deliveries IS NULL;


-- WAREHOUSE TABLE

SELECT *
FROM warehouse
WHERE warehouse_id IS NULL
   OR warehouse_location IS NULL
   OR capacity IS NULL;


-- STORE TABLE

SELECT *
FROM store
WHERE store_id IS NULL
   OR phone_number IS NULL
   OR email IS NULL
   OR store_capacity IS NULL
   OR status IS NULL;


-- CUSTOMER TABLE

SELECT *
FROM customer
WHERE customer_id IS NULL
   OR name IS NULL
   OR dob IS NULL
   OR gender IS NULL
   OR city IS NULL
   OR phone_number IS NULL
   OR email IS NULL
   OR registration_date IS NULL
   OR loyalty_level IS NULL
   OR status IS NULL;


-- EMPLOYEE TABLE

SELECT *
FROM employee
WHERE employee_id IS NULL
   OR employee_name IS NULL
   OR phone_number IS NULL
   OR email IS NULL
   OR city IS NULL
   OR work_category IS NULL
   OR joining_date IS NULL
   OR salary IS NULL
   OR status IS NULL;


-- PRODUCT TABLE

SELECT *
FROM product
WHERE product_id IS NULL
   OR category_id IS NULL
   OR brand IS NULL
   OR cost_price IS NULL
   OR selling_price IS NULL
   OR manufacture_date IS NULL;


-- ORDERS TABLE

SELECT *
FROM orders
WHERE order_id IS NULL
   OR order_date IS NULL
   OR customer_id IS NULL
   OR store_id IS NULL
   OR employee_id IS NULL;


-- ORDER ITEMS TABLE

SELECT *
FROM order_items
WHERE order_id IS NULL
   OR product_id IS NULL
   OR quantity IS NULL
   OR unit_price IS NULL;


-- PAYMENTS TABLE

SELECT *
FROM payments
WHERE payment_id IS NULL
   OR payment_type IS NULL
   OR payment_amount IS NULL
   OR payment_date IS NULL
   OR payment_status IS NULL;


-- RETURNS TABLE

SELECT *
FROM returns
WHERE return_id IS NULL
   OR order_id IS NULL
   OR product_id IS NULL
   OR return_date IS NULL
   OR inspection_status IS NULL
   OR return_type IS NULL;


-- WAREHOUSE INVENTORY TABLE

SELECT *
FROM warehouse_inventory
WHERE warehouse_id IS NULL
   OR product_id IS NULL
   OR current_quantity IS NULL;


-- STORE INVENTORY TABLE

SELECT *
FROM store_inventory
WHERE store_id IS NULL
   OR product_id IS NULL
   OR quantity IS NULL;

/*
========================================================
CATEGORY DUPLICATE VALIDATION
========================================================
Purpose:
Ensure that each product category is unique.

Expected Result:
0 rows.

Business Impact:
Duplicate categories can lead to inconsistent product
classification, inaccurate sales reporting, and incorrect
business insights.
========================================================
*/

SELECT
    category_name,
    COUNT(*) AS total_records
FROM category
GROUP BY category_name
HAVING COUNT(*) > 1;

/*
========================================================
SUPPLIER DUPLICATE VALIDATION
========================================================
Purpose:
Ensure that each supplier is represented only once
in the database.

Expected Result:
0 rows.

Business Impact:
Duplicate supplier records can lead to inaccurate supplier
performance analysis, inconsistent quality ratings,
incorrect delivery statistics, and unreliable procurement
reports.
========================================================
*/

SELECT
    supplier_name,
    COUNT(*) AS total_records
FROM supplier
GROUP BY supplier_name
HAVING COUNT(*) > 1;

/*
========================================================
WAREHOUSE DUPLICATE VALIDATION
========================================================
Purpose:
Ensure that each warehouse has a unique warehouse name.

Expected Result:
0 rows.

Business Impact:
Duplicate warehouse names can lead to inaccurate inventory
tracking, incorrect warehouse capacity reporting,
stock allocation errors, and misleading operational reports.
========================================================
*/

SELECT
    warehouse_name,
    COUNT(*) AS total_records
FROM warehouse
GROUP BY warehouse_name
HAVING COUNT(*) > 1;

/*
========================================================
STORE PHONE NUMBER DUPLICATE VALIDATION
========================================================
Purpose:
Ensure that each store has a unique phone number.

Expected Result:
0 rows.

Business Impact:
Duplicate phone numbers can lead to incorrect store
identification, communication issues, and inaccurate
store records.
========================================================
*/

SELECT
    phone_number,
    COUNT(*) AS total_records
FROM store
GROUP BY phone_number
HAVING COUNT(*) > 1;


/*
========================================================
STORE EMAIL DUPLICATE VALIDATION
========================================================
Purpose:
Ensure that each store has a unique email address.

Expected Result:
0 rows.

Business Impact:
Duplicate email addresses can result in communication
errors, notification failures, and inaccurate store
management records.
========================================================
*/

SELECT
    email,
    COUNT(*) AS total_records
FROM store
GROUP BY email
HAVING COUNT(*) > 1;

/*
========================================================
CUSTOMER PHONE NUMBER DUPLICATE VALIDATION
========================================================
Purpose:
Ensure that each customer has a unique phone number.

Expected Result:
0 rows.

Business Impact:
Duplicate phone numbers can lead to incorrect customer
identification, communication issues, duplicate customer
profiles, and unreliable customer analytics.
========================================================
*/

SELECT
    phone_number,
    COUNT(*) AS total_records
FROM customer
GROUP BY phone_number
HAVING COUNT(*) > 1;


/*
========================================================
CUSTOMER EMAIL DUPLICATE VALIDATION
========================================================
Purpose:
Ensure that each customer has a unique email address.

Expected Result:
0 rows.

Business Impact:
Duplicate email addresses can result in communication
failures, duplicate customer accounts, inaccurate loyalty
tracking, and unreliable customer reporting.
========================================================
*/

SELECT
    email,
    COUNT(*) AS total_records
FROM customer
GROUP BY email
HAVING COUNT(*) > 1;

/*
========================================================
EMPLOYEE PHONE NUMBER DUPLICATE VALIDATION
========================================================
Purpose:
Ensure that each employee has a unique phone number.

Expected Result:
0 rows.

Business Impact:
Duplicate phone numbers can lead to incorrect employee
identification, communication failures, payroll issues,
and inaccurate employee records.
========================================================
*/

SELECT
    phone_number,
    COUNT(*) AS total_records
FROM employee
GROUP BY phone_number
HAVING COUNT(*) > 1;


/*
========================================================
EMPLOYEE EMAIL DUPLICATE VALIDATION
========================================================
Purpose:
Ensure that each employee has a unique email address.

Expected Result:
0 rows.

Business Impact:
Duplicate email addresses can result in communication
errors, incorrect employee identification, notification
failures, and unreliable employee management.
========================================================
*/

SELECT
    email,
    COUNT(*) AS total_records
FROM employee
GROUP BY email
HAVING COUNT(*) > 1;

/*
========================================================
PRODUCT SKU DUPLICATE VALIDATION
========================================================
Purpose:
Ensure that each product has a unique Stock Keeping Unit (SKU).

Expected Result:
0 rows.

Business Impact:
Duplicate SKUs can lead to incorrect inventory tracking,
pricing errors, stock management issues, and unreliable
sales reporting.
========================================================
*/

SELECT
    sku,
    COUNT(*) AS total_records
FROM product
GROUP BY sku
HAVING COUNT(*) > 1;

/*
========================================================
PRODUCT → CATEGORY REFERENTIAL INTEGRITY VALIDATION
========================================================
Purpose:
Verify that every product references an existing category.

Expected Result:
0 rows.

Business Impact:
Products without valid categories cannot be classified
correctly, resulting in inaccurate sales analysis,
inventory reporting, and category-wise business insights.
========================================================
*/

SELECT
    p.product_id,
    p.category_id
FROM product p
LEFT JOIN category c
ON p.category_id = c.category_id
WHERE c.category_id IS NULL;

/*
========================================================
PRODUCT → SUPPLIER REFERENTIAL INTEGRITY VALIDATION
========================================================
Purpose:
Verify that every product references an existing supplier.

Expected Result:
0 rows.

Business Impact:
Products linked to non-existent suppliers can lead to
incorrect supplier analysis, procurement issues,
inaccurate inventory management, and unreliable
supplier performance reporting.
========================================================
*/

SELECT
    p.product_id,
    p.supplier_id
FROM product p
LEFT JOIN supplier s
ON p.supplier_id = s.supplier_id
WHERE s.supplier_id IS NULL;

/*
========================================================
EMPLOYEE → STORE REFERENTIAL INTEGRITY VALIDATION
========================================================
Purpose:
Verify that every employee is assigned to an existing store.

Expected Result:
0 rows.

Business Impact:
Employees assigned to non-existent stores can lead to
incorrect workforce allocation, payroll issues,
management reporting errors, and unreliable operational
analysis.
========================================================
*/

SELECT
    e.employee_id,
    e.store_id
FROM employee e
LEFT JOIN store s
ON e.store_id = s.store_id
WHERE s.store_id IS NULL;

/*
========================================================
ORDERS → CUSTOMER REFERENTIAL INTEGRITY VALIDATION
========================================================
Purpose:
Verify that every order references an existing customer.

Expected Result:
0 rows.

Business Impact:
Orders linked to non-existent customers prevent accurate
customer identification, affect sales reporting, order
tracking, customer support, and customer analytics.
========================================================
*/

SELECT
    o.order_id,
    o.customer_id
FROM orders o
LEFT JOIN customer c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

/*
========================================================
ORDERS → STORE REFERENTIAL INTEGRITY VALIDATION
========================================================
Purpose:
Verify that every order references an existing store.

Expected Result:
0 rows.

Business Impact:
Orders linked to non-existent stores prevent accurate
store-wise sales analysis, revenue reporting, inventory
reconciliation, and operational decision-making.
========================================================
*/

SELECT
    o.order_id,
    o.store_id
FROM orders o
LEFT JOIN store s
ON o.store_id = s.store_id
WHERE s.store_id IS NULL;

/*
========================================================
ORDERS → EMPLOYEE REFERENTIAL INTEGRITY VALIDATION
========================================================
Purpose:
Verify that every order references an existing employee.

Expected Result:
0 rows.

Business Impact:
Orders linked to non-existent employees can lead to
incorrect employee performance analysis, inaccurate
sales attribution, incentive calculation errors,
and unreliable operational reporting.
========================================================
*/

SELECT
    o.order_id,
    o.employee_id
FROM orders o
LEFT JOIN employee e
ON o.employee_id = e.employee_id
WHERE e.employee_id IS NULL;


/*
========================================================
ORDER ITEMS → ORDERS REFERENTIAL INTEGRITY VALIDATION
========================================================
Purpose:
Verify that every order item belongs to an existing order.

Expected Result:
0 rows.

Business Impact:
Order items linked to non-existent orders can lead to
incomplete order history, incorrect sales reporting,
broken customer purchase records, and unreliable
business analytics.
========================================================
*/

SELECT
    od.order_id,
    od.product_id
FROM order_items od
LEFT JOIN orders o
ON od.order_id = o.order_id
WHERE o.order_id IS NULL;

/*
========================================================
ORDER ITEMS → PRODUCT REFERENTIAL INTEGRITY VALIDATION
========================================================
Purpose:
Verify that every order item references an existing product.

Expected Result:
0 rows.

Business Impact:
Order items linked to non-existent products can lead to
incorrect inventory management, inaccurate product-wise
sales reporting, unreliable revenue analysis, and
incomplete customer order history.
========================================================
*/

SELECT
    od.order_id,
    od.product_id
FROM order_items od
LEFT JOIN product p
ON od.product_id = p.product_id
WHERE p.product_id IS NULL;

/*
========================================================
PAYMENTS → ORDERS REFERENTIAL INTEGRITY VALIDATION
========================================================
Purpose:
Verify that every payment references an existing order.

Expected Result:
0 rows.

Business Impact:
Payments linked to non-existent orders can lead to
incorrect payment tracking, inaccurate financial
reporting, revenue reconciliation issues, and unreliable
payment analysis.
========================================================
*/

SELECT
    p.payment_id,
    p.order_id
FROM payments p
LEFT JOIN orders o
ON p.order_id = o.order_id
WHERE o.order_id IS NULL;

/*
========================================================
RETURNS → ORDERS REFERENTIAL INTEGRITY VALIDATION
========================================================
Purpose:
Verify that every return references an existing order.

Expected Result:
0 rows.

Business Impact:
Returns linked to non-existent orders prevent the
organization from verifying the original purchase,
identifying the customer, validating return requests,
and performing accurate return analysis.
========================================================
*/

SELECT
    r.return_id,
    r.order_id
FROM returns r
LEFT JOIN orders o
ON r.order_id = o.order_id
WHERE o.order_id IS NULL;

/*
========================================================
RETURNS → PRODUCT REFERENTIAL INTEGRITY VALIDATION
========================================================
Purpose:
Verify that every return references an existing product.

Expected Result:
0 rows.

Business Impact:
Returns linked to non-existent products prevent the
organization from identifying which product was returned,
affect refund processing, inventory updates, return
verification, and return analysis.
========================================================
*/

SELECT
    r.return_id,
    r.product_id
FROM returns r
LEFT JOIN product p
ON r.product_id = p.product_id
WHERE p.product_id IS NULL;

/*
========================================================
WAREHOUSE INVENTORY → WAREHOUSE REFERENTIAL INTEGRITY VALIDATION
========================================================
Purpose:
Verify that every warehouse inventory record references
an existing warehouse.

Expected Result:
0 rows.

Business Impact:
Warehouse inventory records linked to non-existent
warehouses can lead to incorrect inventory allocation,
warehouse tracking issues, inaccurate stock reporting,
and unreliable warehouse operations.
========================================================
*/

SELECT
    w.warehouse_id,
    w.product_id
FROM warehouse_inventory w
LEFT JOIN warehouse wh
ON w.warehouse_id = wh.warehouse_id
WHERE wh.warehouse_id IS NULL;

/*
========================================================
WAREHOUSE INVENTORY → PRODUCT REFERENTIAL INTEGRITY VALIDATION
========================================================
Purpose:
Verify that every warehouse inventory record references
an existing product.

Expected Result:
0 rows.

Business Impact:
Warehouse inventory records linked to non-existent
products can lead to inaccurate inventory tracking,
stock management issues, incorrect inventory reports,
and unreliable warehouse operations.
========================================================
*/

SELECT
    w.warehouse_id,
    w.product_id
FROM warehouse_inventory w
LEFT JOIN product p
ON w.product_id = p.product_id
WHERE p.product_id IS NULL;



/*
========================================================
STORE INVENTORY → STORE REFERENTIAL INTEGRITY VALIDATION
========================================================
Purpose:
Verify that every store inventory record references
an existing store.

Expected Result:
0 rows.

Business Impact:
Store inventory records linked to non-existent stores
prevent the organization from identifying where the
inventory is located, affecting stock management,
store-wise inventory reporting, and operational analysis.
========================================================
*/

SELECT
    s.store_id,
    s.product_id
FROM store_inventory s
LEFT JOIN store st
ON s.store_id = st.store_id
WHERE st.store_id IS NULL;

/*
========================================================
STORE INVENTORY → PRODUCT REFERENTIAL INTEGRITY VALIDATION
========================================================
Purpose:
Verify that every store inventory record references
an existing product.

Expected Result:
0 rows.

Business Impact:
Store inventory records linked to non-existent products
prevent the organization from identifying which products
are available at each store, affecting inventory
management, stock availability, and product-wise
reporting.
========================================================
*/

SELECT
    s.store_id,
    s.product_id
FROM store_inventory s
LEFT JOIN product p
ON s.product_id = p.product_id
WHERE p.product_id IS NULL;

s


