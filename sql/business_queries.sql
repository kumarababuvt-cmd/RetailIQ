/*
========================================================
RETAILIQ BUSINESS QUERIES
========================================================
Author      : KUMARA BABU V T
Database    : RetailIQ
Description :
This file contains business-oriented SQL queries used
to analyze sales, customers, inventory, payments,
employees, suppliers, and overall business performance.
========================================================
*/

/*
========================================================
SALES KPI ANALYSIS
========================================================
*/
/*
========================================================
TOTAL REVENUE
========================================================
Purpose:
Calculate the total revenue generated from all products
sold across all orders.

Formula:
Revenue = Quantity × Unit Price

Business Use:
This KPI measures the overall sales performance of
RetailIQ and serves as the primary revenue indicator
for business reporting and executive dashboards.
========================================================
*/

SELECT
    SUM(quantity * unit_price) AS total_revenue
FROM order_items;


/*
========================================================
TOTAL ORDERS
========================================================
Purpose:
Calculate the total number of orders placed by customers.

Business Use:
This KPI measures the overall order volume and helps
the organization analyze sales activity, customer demand,
and business growth over time.
========================================================
*/

SELECT
    COUNT(order_id) AS total_orders
FROM orders;

/*
========================================================
TOTAL CUSTOMERS
========================================================
Purpose:
Calculate the total number of registered customers.

Business Use:
This KPI measures the size of the customer base and
helps the organization analyze customer growth,
market reach, and overall business expansion.
========================================================
*/

SELECT
    COUNT(customer_id) AS total_customers
FROM customer;

/*
========================================================
TOTAL PRODUCTS SOLD
========================================================
Purpose:
Calculate the total number of product units sold across
all customer orders.

Business Use:
This KPI measures the total sales volume and helps the
organization analyze product demand, inventory movement,
and overall sales performance.
========================================================
*/

SELECT
    SUM(quantity) AS total_products_sold
FROM order_items;

/*
========================================================
AVERAGE ORDER VALUE (AOV)
========================================================
Purpose:
Calculate the average revenue generated per customer order.

Formula:
Average Order Value = Total Revenue / Total Orders

Business Use:
This KPI helps the organization understand customer
spending behavior and evaluate sales performance.
A higher Average Order Value indicates customers are
spending more per purchase.
========================================================
*/

SELECT
    SUM(quantity * unit_price) / COUNT(DISTINCT order_id) AS average_order_value
FROM order_items;
/*
========================================================
AVERAGE ITEMS PER ORDER
========================================================
Purpose:
Calculate the average number of product units purchased
in a single customer order.

Formula:
Average Items Per Order =
Total Quantity Sold / Total Number of Orders

Business Use:
This KPI helps RetailIQ understand customer purchasing
behavior and average basket size. A higher value indicates
that customers are purchasing more products per order,
which can help evaluate cross-selling and promotional
strategies.
========================================================
*/

SELECT
    ROUND(SUM(quantity) / COUNT(DISTINCT order_id)) AS average_items_per_order
FROM order_items;

/*
========================================================
PAYMENT SUCCESS RATE
========================================================
Purpose:
Calculate the percentage of successfully completed
payments out of all payment attempts.

Formula:
Payment Success Rate =
(Completed Payments / Total Payments) × 100

Business Use:
This KPI helps RetailIQ evaluate payment processing
performance. A higher payment success rate indicates
a smooth customer checkout experience and efficient
payment processing, while a lower rate may indicate
payment failures, technical issues, or customer
drop-offs during checkout.
========================================================
*/

SELECT
(
    (
        SELECT COUNT(payment_id)
        FROM payments
        WHERE payment_status = 'completed'
    )
    /
    COUNT(payment_id)
) * 100 AS payment_success_rate
FROM payments;

/*
========================================================
PRODUCT RETURN RATE
========================================================
Purpose:
Calculate the percentage of sold products that were
successfully returned after passing inspection.

Formula:
Product Return Rate =
(Approved Returned Products / Total Products Sold) × 100

Business Use:
This KPI helps RetailIQ monitor the percentage of
products returned by customers. A high product return
rate may indicate product quality issues, customer
dissatisfaction, inaccurate product descriptions, or
logistics problems. It also helps management evaluate
return trends and improve overall customer satisfaction.
========================================================
*/

SELECT
(
    (
        SELECT COUNT(return_id)
        FROM returns
        WHERE inspection_status = 'passed'
    )
    /
    SUM(quantity)
) * 100 AS product_return_rate
FROM order_items;

/*
========================================================
REVENUE PER CUSTOMER
========================================================
Purpose:
Calculate the average revenue generated per registered
customer.

Formula:
Revenue Per Customer =
Total Revenue / Total Registered Customers

Business Use:
This KPI helps RetailIQ measure the average revenue
contributed by each registered customer. It is useful
for evaluating customer value, tracking business growth,
and measuring the effectiveness of customer acquisition
and retention strategies.
========================================================
*/

SELECT
(
    (
        SELECT SUM(quantity * unit_price)
        FROM order_items
    )
    /
    COUNT(customer_id)
) AS revenue_per_customer
FROM customer;

/*
========================================================
REVENUE PER STORE
========================================================
Purpose:
Calculate the total revenue generated by each retail
store.

Formula:
Revenue Per Store =
SUM(Quantity × Unit Price)

Business Use:
This KPI helps RetailIQ evaluate the sales performance
of each store. It enables management to identify
high-performing and low-performing stores, compare
store-wise revenue, optimize inventory allocation,
and support strategic business decisions.
========================================================
*/

SELECT
    s.store_id,
    SUM(oi.quantity * oi.unit_price) AS revenue_per_store
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
JOIN store s
ON o.store_id = s.store_id
GROUP BY s.store_id;

/*
========================================================
REVENUE PER EMPLOYEE
========================================================
Purpose:
Calculate the total revenue generated by each employee.

Formula:
Revenue Per Employee =
SUM(Quantity × Unit Price)

Business Use:
This KPI helps RetailIQ evaluate employee sales
performance by measuring the revenue generated by each
employee. It supports performance analysis, incentive
calculation, sales recognition, and workforce planning.
========================================================
*/

SELECT
    e.employee_id,
    SUM(oi.quantity * oi.unit_price) AS revenue_per_employee
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
JOIN employee e
ON o.employee_id = e.employee_id
GROUP BY e.employee_id
ORDER BY e.employee_id;

/*
========================================================
REVENUE BY CATEGORY
========================================================
Purpose:
Calculate the total revenue generated by each product
category and rank the categories based on revenue.

Formula:
Revenue =
SUM(Quantity × Unit Price)

Business Use:
This analysis helps RetailIQ identify the highest and
lowest revenue-generating product categories. The
results support inventory planning, marketing
strategies, category performance evaluation, and
business decision-making.
========================================================
*/

SELECT
    c.category_name,
    SUM(oi.quantity * oi.unit_price) AS revenue_by_category
FROM order_items oi
JOIN product p
ON oi.product_id = p.product_id
JOIN category c
ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY revenue_by_category DESC;

/*
========================================================
REVENUE BY BRAND
========================================================
Purpose:
Calculate the total revenue generated by each product
brand and rank the brands based on revenue.


Revenue Contribution by Supplier
Formula:
Revenue =
SUM(Quantity × Unit Price)

Business Use:
This analysis helps RetailIQ identify the highest and
lowest revenue-generating brands. The results support
brand performance evaluation, inventory planning,
marketing strategies, supplier negotiations, and
business decision-making.
========================================================
*/

SELECT
    p.brand,
    SUM(oi.quantity * oi.unit_price) AS revenue_by_brand
FROM order_items oi
JOIN product p
ON oi.product_id = p.product_id
GROUP BY p.brand
ORDER BY revenue_by_brand DESC;

/*
========================================================
REVENUE CONTRIBUTION BY SUPPLIER
========================================================
Purpose:
Calculate the total revenue generated from products
supplied by each supplier and rank suppliers based on
their revenue contribution.

Formula:
Revenue =
SUM(Quantity × Unit Price)

Business Use:
This analysis helps RetailIQ evaluate how much revenue
each supplier's products contribute to the business.
The results support supplier performance evaluation,
inventory planning, procurement decisions, strategic
partnerships, and supplier contract negotiations.
========================================================
*/

SELECT
    s.supplier_name,
    SUM(oi.quantity * oi.unit_price) AS revenue_contribution
FROM order_items oi
JOIN product p
ON oi.product_id = p.product_id
JOIN supplier s
ON p.supplier_id = s.supplier_id
GROUP BY s.supplier_name
ORDER BY revenue_contribution DESC;

/*
========================================================
REVENUE BY MONTH
========================================================
Purpose:
Calculate the total revenue generated in each month.

Formula:
Revenue =
SUM(Quantity × Unit Price)

Business Use:
This analysis helps RetailIQ identify monthly sales
performance, seasonal trends, peak sales periods,
and supports forecasting, inventory planning, and
marketing campaign decisions.
========================================================
*/

SELECT
    MONTHNAME(o.order_date) AS month_name,
    SUM(oi.quantity * oi.unit_price) AS revenue_by_month
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
GROUP BY MONTHNAME(o.order_date)
ORDER BY revenue_by_month DESC;

/*
========================================================
REVENUE BY QUARTER
========================================================
Purpose:
Calculate the total revenue generated in each quarter.

Formula:
Revenue =
SUM(Quantity × Unit Price)

Business Use:
This analysis helps RetailIQ evaluate quarterly sales
performance, identify seasonal trends, compare business
growth across quarters, and support forecasting,
inventory planning, and strategic decision-making.
========================================================
*/

SELECT
    CONCAT('Q', QUARTER(o.order_date)) AS quarter_of_year,
    SUM(oi.quantity * oi.unit_price) AS revenue_by_quarter
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
GROUP BY QUARTER(o.order_date)
ORDER BY QUARTER(o.order_date);

/*
========================================================
REVENUE BY YEAR
========================================================
Purpose:
Calculate the total revenue generated in each calendar
year.

Formula:
Revenue =
SUM(Quantity × Unit Price)

Business Use:
This analysis helps RetailIQ evaluate yearly sales
performance, compare business growth across years,
identify long-term revenue trends, and support
strategic planning and forecasting.
========================================================
*/

SELECT
    YEAR(o.order_date) AS order_year,
    SUM(oi.quantity * oi.unit_price) AS revenue_by_year
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
GROUP BY YEAR(o.order_date)
ORDER BY YEAR(o.order_date);

/*
========================================================
TOP 10 BEST-SELLING PRODUCTS
========================================================
Purpose:
Identify the top 10 products with the highest number
of units sold.

Formula:
Total Quantity Sold =
SUM(Quantity)

Business Use:
This analysis helps RetailIQ identify the most popular
products based on sales volume. It supports inventory
planning, demand forecasting, stock replenishment,
marketing campaigns, and product performance analysis.
========================================================
*/

SELECT
    p.model AS product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN product p
ON oi.product_id = p.product_id
GROUP BY p.model
ORDER BY total_quantity_sold DESC
LIMIT 10;

/*
========================================================
BOTTOM 10 SELLING PRODUCTS
========================================================
Purpose:
Identify the 10 products with the lowest number of
units sold.

Formula:
Total Quantity Sold =
SUM(Quantity)

Business Use:
This analysis helps RetailIQ identify slow-moving
products that may require promotional campaigns,
pricing adjustments, inventory optimization, or
discontinuation decisions. It also supports demand
forecasting and inventory management.
========================================================
*/

SELECT
    p.model AS product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN product p
ON oi.product_id = p.product_id
GROUP BY p.model
ORDER BY total_quantity_sold ASC
LIMIT 10;



/*
========================================================
HIGHEST REVENUE PRODUCT
========================================================
Purpose:
Identify the product that generated the highest total
revenue.

Formula:
Revenue =
SUM(Quantity × Unit Price)

Business Use:
This analysis helps RetailIQ identify the highest
revenue-generating product. It supports product
performance evaluation, pricing strategies, inventory
planning, and marketing decisions by highlighting the
most valuable product in terms of sales revenue.
========================================================
*/

SELECT
    p.model AS product_name,
    SUM(oi.quantity * oi.unit_price) AS highest_revenue_product
FROM order_items oi
JOIN product p
ON oi.product_id = p.product_id
GROUP BY p.model
ORDER BY highest_revenue_product DESC
LIMIT 1;


/*
========================================================
LOWEST REVENUE PRODUCT
========================================================
Purpose:
Identify the product that generated the lowest total
revenue.

Formula:
Revenue =
SUM(Quantity × Unit Price)

Business Use:
This analysis helps RetailIQ identify products with
poor revenue performance. The results support pricing
strategies, promotional campaigns, inventory
optimization, and product portfolio decisions.
========================================================
*/

SELECT
    p.model AS product_name,
    SUM(oi.quantity * oi.unit_price) AS product_revenue
FROM order_items oi
JOIN product p
ON oi.product_id = p.product_id
GROUP BY p.model
ORDER BY product_revenue ASC
LIMIT 1;

/*
========================================================
PRODUCT REVENUE CONTRIBUTION (%)
========================================================
Purpose:
Calculate the percentage contribution of each product
to the company's total revenue.

Formula:
Revenue Contribution (%) =
(Product Revenue / Total Company Revenue) × 100

Business Use:
This analysis helps RetailIQ identify which products
contribute the most to overall revenue. It supports
product portfolio evaluation, pricing strategies,
inventory planning, and business decision-making by
highlighting high-value products.
========================================================
*/

SELECT
    p.model AS product_name,
    SUM(oi.quantity * oi.unit_price) AS product_revenue,
    ROUND(
        (
            SUM(oi.quantity * oi.unit_price) /
            (
                SELECT SUM(quantity * unit_price)
                FROM order_items
            )
        ) * 100,
        2
    ) AS revenue_contribution_percentage
FROM order_items oi
JOIN product p
ON oi.product_id = p.product_id
GROUP BY p.model
ORDER BY revenue_contribution_percentage DESC;

/*
========================================================
CATEGORY REVENUE CONTRIBUTION (%)
========================================================
Purpose:
Calculate the percentage contribution of each product
category to the company's total revenue.

Formula:
Revenue Contribution (%) =
(Category Revenue / Total Company Revenue) × 100

Business Use:
This analysis helps RetailIQ identify which product
categories contribute the most to overall revenue.
The results support category performance evaluation,
inventory planning, marketing investments, and
strategic business decisions.
========================================================
*/

SELECT
    c.category_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    ROUND(
        (
            SUM(oi.quantity * oi.unit_price)
            /
            (
                SELECT SUM(quantity * unit_price)
                FROM order_items
            )
        ) * 100,
        2
    ) AS revenue_contribution
FROM order_items oi
JOIN product p
ON oi.product_id = p.product_id
JOIN category c
ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY revenue_contribution DESC;

/*
========================================================
BRAND REVENUE CONTRIBUTION (%)
========================================================
Purpose:
Calculate the percentage contribution of each product
brand to the company's total revenue.

Formula:
Revenue Contribution (%) =
(Brand Revenue / Total Company Revenue) × 100

Business Use:
This analysis helps RetailIQ identify the brands that
contribute the most to overall revenue. The results
support brand performance evaluation, supplier
management, inventory planning, marketing strategies,
and strategic business decisions.
========================================================
*/

SELECT
    p.brand AS brand_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    ROUND(
        (
            SUM(oi.quantity * oi.unit_price)
            /
            (
                SELECT SUM(quantity * unit_price)
                FROM order_items
            )
        ) * 100,
        2
    ) AS revenue_contribution
FROM order_items oi
JOIN product p
ON oi.product_id = p.product_id
GROUP BY p.brand
ORDER BY revenue_contribution DESC;

/*
========================================================
TOP 10 CUSTOMERS BY SPENDING
========================================================
Purpose:
Identify the top 10 customers based on their total
spending.

Formula:
Customer Spending =
SUM(Quantity × Unit Price)

Business Use:
This analysis helps RetailIQ identify high-value
customers based on their total purchases. It supports
customer segmentation, loyalty programs, personalized
marketing campaigns, and customer relationship
management.
========================================================
*/

SELECT
    c.customer_id,
    c.name AS customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spending
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
JOIN customer c
ON o.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.name
ORDER BY total_spending DESC
LIMIT 10;

/*
========================================================
REVENUE BY STORE LOCATION
========================================================
Purpose:
Calculate the total revenue generated by each store
location.

Formula:
Revenue =
SUM(Quantity × Unit Price)

Business Use:
This analysis helps RetailIQ identify the highest
revenue-generating store locations. The results support
regional performance analysis, inventory allocation,
resource planning, marketing campaigns, and operational
decision-making.
========================================================
*/

SELECT
    s.store_location,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
JOIN store s
ON o.store_id = s.store_id
GROUP BY s.store_location
ORDER BY total_revenue DESC;

/*
========================================================
TOP 10 EMPLOYEES BY REVENUE GENERATED
========================================================
Purpose:
Identify the top 10 employees based on the total
revenue they generated through customer sales.

Formula:
Employee Revenue =
SUM(Quantity × Unit Price)

Business Use:
This analysis helps RetailIQ evaluate employee
performance, recognize top-performing employees,
design incentive programs, support performance
appraisals, and identify employees who may require
additional training or coaching.
========================================================
*/

SELECT
    e.employee_id,
    e.employee_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
JOIN employee e
ON o.employee_id = e.employee_id
GROUP BY
    e.employee_id,
    e.employee_name
ORDER BY total_revenue DESC
LIMIT 10;

/*
========================================================
BOTTOM 10 EMPLOYEES BY REVENUE GENERATED
========================================================
Purpose:
Identify the 10 employees who generated the lowest
sales revenue.

Formula:
Employee Revenue =
SUM(Quantity × Unit Price)

Business Use:
This analysis helps RetailIQ identify employees with
low sales performance. The results support performance
evaluation, targeted training programs, coaching,
workforce planning, and incentive improvements.
========================================================
*/

SELECT
    e.employee_id,
    e.employee_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
JOIN employee e
ON o.employee_id = e.employee_id
GROUP BY
    e.employee_id,
    e.employee_name
ORDER BY total_revenue ASC
LIMIT 10;

/*
========================================================
EMPLOYEE REVENUE CONTRIBUTION (%)
========================================================
Purpose:
Calculate the percentage contribution of each employee
to the company's total revenue.

Formula:
Revenue Contribution (%) =
(Employee Revenue / Total Company Revenue) × 100

Business Use:
This analysis helps RetailIQ evaluate each employee's
contribution to overall business revenue. The results
support performance evaluation, incentive planning,
recognition programs, workforce planning, and sales
strategy improvements.
========================================================
*/

SELECT
    e.employee_id,
    e.employee_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    ROUND(
        (
            SUM(oi.quantity * oi.unit_price)
            /
            (
                SELECT SUM(quantity * unit_price)
                FROM order_items
            )
        ) * 100,
        2
    ) AS revenue_contribution
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
JOIN employee e
ON o.employee_id = e.employee_id
GROUP BY
    e.employee_id,
    e.employee_name
ORDER BY revenue_contribution DESC
LIMIT 10;

/*
========================================================
AVERAGE REVENUE PER EMPLOYEE
========================================================
Purpose:
Calculate the average revenue generated per employee.

Formula:
Average Revenue Per Employee =
Total Company Revenue / Total Number of Employees

Business Use:
This KPI helps RetailIQ measure workforce productivity
by showing the average revenue generated by each
employee. The results support workforce planning,
performance benchmarking, hiring decisions, and
business growth analysis.
========================================================
*/

SELECT
ROUND(
(
    SELECT SUM(quantity * unit_price)
    FROM order_items
)
/
(
    SELECT COUNT(employee_id)
    FROM employee
),
2
) AS average_revenue_per_employee;


/*
========================================================
TOP 10 STORES BY REVENUE
========================================================
Purpose:
Identify the top 10 stores that generated the highest
sales revenue.

Formula:
Store Revenue =
SUM(Quantity × Unit Price)

Business Use:
This analysis helps RetailIQ identify the best
performing store locations. The results support
regional performance evaluation, inventory allocation,
marketing investments, resource planning, and business
expansion decisions.
========================================================
*/

SELECT
    s.store_id,
    s.store_location,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
JOIN store s
ON o.store_id = s.store_id
GROUP BY
    s.store_id,
    s.store_location
ORDER BY total_revenue DESC
LIMIT 10;

/*
========================================================
BOTTOM 10 STORES BY REVENUE
========================================================
Purpose:
Identify the 10 store locations that generated the
lowest sales revenue.

Formula:
Store Revenue =
SUM(Quantity × Unit Price)

Business Use:
This analysis helps RetailIQ identify underperforming
store locations. The results support operational
improvements, inventory optimization, local marketing
strategies, resource allocation, and business
performance evaluation.
========================================================
*/

SELECT
    s.store_id,
    s.store_location,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
JOIN store s
ON o.store_id = s.store_id
GROUP BY
    s.store_id,
    s.store_location
ORDER BY total_revenue ASC
LIMIT 10;
/*
========================================================
STORE REVENUE CONTRIBUTION (%)
========================================================
Purpose:
Calculate the percentage contribution of each store
location to the company's total revenue.

Formula:
Revenue Contribution (%) =
(Store Revenue / Total Company Revenue) × 100

Business Use:
This analysis helps RetailIQ identify which store
locations contribute the most to overall revenue.
The results support regional performance evaluation,
inventory allocation, marketing investments,
operational planning, and business expansion
decisions.
========================================================
*/

SELECT
    s.store_id,
    s.store_location,
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    ROUND(
        (
            SUM(oi.quantity * oi.unit_price)
            /
            (
                SELECT SUM(quantity * unit_price)
                FROM order_items
            )
        ) * 100,
        2
    ) AS revenue_contribution
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
JOIN store s
ON o.store_id = s.store_id
GROUP BY
    s.store_id,
    s.store_location
ORDER BY revenue_contribution DESC
LIMIT 10;
/*
========================================================
AVERAGE REVENUE PER STORE
========================================================
Purpose:
Calculate the average revenue generated by each store.

Formula:
Average Revenue Per Store =
Total Company Revenue / Total Number of Stores

Business Use:
This KPI helps RetailIQ measure the average revenue
generated by each store location. The results support
store performance benchmarking, expansion planning,
resource allocation, and operational decision-making.
========================================================
*/

SELECT
ROUND(
(
    SELECT SUM(quantity * unit_price)
    FROM order_items
)
/
(
    SELECT COUNT(store_id)
    FROM store
),
2
) AS average_revenue_per_store;
/*
========================================================
REVENUE BY PAYMENT METHOD
========================================================
Purpose:
Calculate the total revenue generated through each
payment method.

Formula:
Revenue =
SUM(Quantity × Unit Price)

Business Use:
This analysis helps RetailIQ understand customer
payment preferences and evaluate the revenue generated
through each payment method. The results support
payment strategy, operational planning, and customer
experience improvements.

Note:
If the business requires only successfully received
payments, filter the query using:
payment_status = 'completed'
========================================================
*/

SELECT
    p.payment_type AS payment_method,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN payments p
ON oi.order_id = p.order_id
GROUP BY p.payment_type
ORDER BY total_revenue DESC;

/*
========================================================
PAYMENT METHOD DISTRIBUTION (%)
========================================================
Purpose:
Calculate the percentage distribution of payment
transactions across different payment methods.

Formula:
Payment Method Distribution (%) =
(Payment Transactions by Method /
 Total Payment Transactions) × 100

Business Use:
This analysis helps RetailIQ understand customer
payment preferences. The results support payment
gateway optimization, promotional offers, operational
planning, and customer experience improvements.
========================================================
*/

SELECT
    p.payment_type AS payment_method,
    COUNT(p.payment_id) AS total_transactions,
    ROUND(
        (
            COUNT(p.payment_id)
            /
            (
                SELECT COUNT(payment_id)
                FROM payments
            )
        ) * 100,
        2
    ) AS transaction_distribution
FROM payments p
GROUP BY p.payment_type
ORDER BY transaction_distribution DESC;

/*
========================================================
PAYMENT STATUS DISTRIBUTION (%)
========================================================
Purpose:
Calculate the percentage distribution of payment
transactions by payment status.

Formula:
Payment Status Distribution (%) =
(Payments with a Status /
 Total Payment Transactions) × 100

Business Use:
This analysis helps RetailIQ monitor payment health by
tracking the distribution of completed, failed,
pending, and returned payment transactions. The
results support payment gateway monitoring, operational
improvements, customer service, and financial
performance analysis.
========================================================
*/

SELECT
    p.payment_status,
    COUNT(p.payment_id) AS total_transactions,
    ROUND(
        (
            COUNT(p.payment_id)
            /
            (
                SELECT COUNT(payment_id)
                FROM payments
            )
        ) * 100,
        2
    ) AS transaction_distribution
FROM payments p
GROUP BY p.payment_status
ORDER BY transaction_distribution DESC;

/*
========================================================
AVERAGE PAYMENT AMOUNT
========================================================
Purpose:
Calculate the average amount received per completed
payment transaction.

Formula:
Average Payment Amount =
Total Amount Received / Number of Completed Payments

Business Use:
This KPI helps RetailIQ understand the average value of
successful payment transactions. The results support
revenue forecasting, customer spending analysis,
payment performance monitoring, and financial planning.
========================================================
*/

SELECT
    ROUND(
        (
            SELECT SUM(quantity * unit_price)
            FROM order_items
            WHERE order_id IN (
                SELECT order_id
                FROM payments
                WHERE payment_status = 'completed'
            )
        )
        /
        (
            SELECT COUNT(payment_id)
            FROM payments
            WHERE payment_status = 'completed'
        ),
        2
    ) AS average_payment_amount;
/*
========================================================
AVERAGE PAYMENT AMOUNT BY PAYMENT METHOD
========================================================
Purpose:
Calculate the average amount received for each payment
method based on successfully completed payment
transactions.

Formula:
Average Payment Amount =
Total Revenue by Payment Method /
Number of Completed Payments by Payment Method

Business Use:
This analysis helps RetailIQ understand the average
transaction value for each payment method. The results
support customer payment behavior analysis, payment
strategy optimization, and financial decision-making.
========================================================
*/

SELECT
    p.payment_type AS payment_method,
    ROUND(
        SUM(oi.quantity * oi.unit_price)
        /
        COUNT(p.payment_id),
        2
    ) AS average_payment_amount
FROM order_items oi
JOIN payments p
ON oi.order_id = p.order_id
WHERE p.payment_status = 'completed'
GROUP BY p.payment_type
ORDER BY average_payment_amount DESC;
/*
========================================================
TOP 10 MOST RETURNED PRODUCTS
========================================================
Purpose:
Identify the products with the highest number of
successfully verified returns.

Formula:
Total Returns =
COUNT(Return ID)

Business Use:
This analysis helps RetailIQ identify products with
high verified return volumes. The results support
quality control, supplier evaluation, product
improvements, and customer satisfaction initiatives.
========================================================
*/

SELECT
    p.model AS product_name,
    COUNT(r.return_id) AS total_returns
FROM returns r
JOIN product p
ON r.product_id = p.product_id
WHERE r.inspection_status = 'passed'
GROUP BY
    p.product_id,
    p.model
ORDER BY total_returns DESC
LIMIT 10;
/*
========================================================
BOTTOM 10 LEAST RETURNED PRODUCTS
========================================================
Purpose:
Identify the products with the lowest number of
successfully verified returns.

Formula:
Total Returns =
COUNT(Return ID)

Business Use:
This analysis helps RetailIQ identify products with
very few verified returns, indicating better product
quality and higher customer satisfaction.

Note:
This query includes only products that have at least
one verified return. Products with zero returns are
not included because the query starts from the
returns table.
========================================================
*/

SELECT
    p.product_id,
    p.model AS product_name,
    COUNT(r.return_id) AS total_returns
FROM returns r
JOIN product p
ON r.product_id = p.product_id
WHERE r.inspection_status = 'passed'
GROUP BY
    p.product_id,
    p.model
ORDER BY total_returns ASC
LIMIT 10;
/*
========================================================
PRODUCTS WITH THE LEAST RETURNS (INCLUDING ZERO RETURNS)
========================================================
Purpose:
Identify products with the lowest number of returns,
including products that have never been returned.

Formula:
Total Returns =
COUNT(Return ID)

Business Use:
This analysis helps RetailIQ identify high-quality
products with excellent customer satisfaction ands
minimal return rates. Products with zero returns
represent potential best-performing products.
========================================================
*/

SELECT
    p.product_id,
    p.model AS product_name,
    COUNT(r.return_id) AS total_returns
FROM product p
LEFT JOIN returns r
ON p.product_id = r.product_id
GROUP BY
    p.product_id,
    p.model
ORDER BY total_returns ASC
LIMIT 10;

/*
========================================================
RETURN RECORD RATE BY PRODUCT
========================================================
Purpose:
Calculate the return record rate for each product based
on the number of return records relative to the total
quantity sold.

Formula:
Return Record Rate (%) =
(Number of Return Records / Total Quantity Sold) × 100

Business Use:
This analysis helps RetailIQ identify products with a
higher frequency of return records relative to their
sales volume. Products with higher return record rates
may require further quality inspection or supplier
evaluation.

Note:
The current RetailIQ schema stores only return records
and does not contain a returned_quantity column.
Therefore, an exact quantity-based return rate cannot
be calculated. This KPI uses return records as a proxy
metric.
========================================================
*/

/*
========================================================
CURRENT STOCK BY CATEGORY
========================================================
Purpose:
Calculate the total inventory available for each product
category.

Formula:
Current Stock =
SUM(Current Quantity)

Business Use:
This analysis helps RetailIQ identify which product
categories have the highest inventory levels. The
results support inventory planning, warehouse
management, replenishment decisions, and stock
optimization.
========================================================
*/

SELECT
    c.category_name,
    SUM(w.current_quantity) AS current_stock
FROM category c
JOIN product p
ON c.category_id = p.category_id
JOIN warehouse_inventory w
ON p.product_id = w.product_id
GROUP BY
    c.category_id,
    c.category_name
ORDER BY current_stock DESC;

/*
========================================================
CURRENT STOCK BY BRAND
========================================================
Purpose:
Calculate the total inventory available for each brand.

Formula:
Current Stock =
SUM(Current Quantity)

Business Use:
This analysis helps RetailIQ identify brands with the
highest inventory levels. The results support inventory
planning, warehouse optimization, supplier coordination,
and stock replenishment decisions.
========================================================
*/

SELECT
    p.brand,
    SUM(w.current_quantity) AS current_stock
FROM product p
JOIN warehouse_inventory w
ON p.product_id = w.product_id
GROUP BY
    p.brand
ORDER BY current_stock DESC;

/*
========================================================
LOW STOCK PRODUCTS
========================================================
Purpose:
Identify products with low inventory levels.

Formula:
Current Stock =
SUM(Current Quantity)

Business Rule:
Products with current stock below 2,500 units are
considered low stock for this analysis.

Business Use:
This analysis helps RetailIQ identify products that
may require replenishment to avoid stock shortages
and improve inventory planning.
========================================================
*/

SELECT
    p.product_id,
    p.model AS product_name,
    SUM(w.current_quantity) AS current_stock
FROM product p
JOIN warehouse_inventory w
ON p.product_id = w.product_id
GROUP BY
    p.product_id,
    p.model
HAVING
    current_stock < 2500
ORDER BY
    current_stock ASC;

/*
========================================================
OUT OF STOCK PRODUCTS
========================================================
Purpose:
Identify products that currently have zero inventory.

Business Rule:
Products with Current Quantity = 0 are considered
out of stock.

Business Use:
This analysis helps RetailIQ identify products that
require immediate replenishment to prevent lost sales
and improve inventory availability.
========================================================
*/

SELECT
    p.product_id,
    p.model AS product_name,
    w.current_quantity
FROM warehouse_inventory w
JOIN product p
ON w.product_id = p.product_id
WHERE
    w.current_quantity = 0
ORDER BY
    p.model;
/*
========================================================
AVERAGE STOCK BY CATEGORY
========================================================
Purpose:
Calculate the average inventory available per product
within each category.

Formula:
Average Stock =
AVG(Current Quantity)

Business Use:
This analysis helps RetailIQ understand inventory
distribution across product categories. Categories
with consistently lower average stock may require
frequent replenishment planning, while higher averages
may indicate excess inventory.
========================================================
*/

SELECT
    c.category_name,
    AVG(w.current_quantity) AS average_stock
FROM category c
JOIN product p
ON c.category_id = p.category_id
JOIN warehouse_inventory w
ON p.product_id = w.product_id
GROUP BY
    c.category_id,
    c.category_name
ORDER BY
    average_stock DESC;

/*
========================================================
SUPPLIER PRODUCT COUNT
========================================================
Purpose:
Calculate the number of products supplied by each
supplier.

Formula:
Number of Products =
COUNT(Product ID)

Business Use:
This analysis helps RetailIQ understand supplier
diversity, evaluate supplier dependency, and identify
suppliers with broader product portfolios.
========================================================
*/

SELECT
    s.supplier_name,
    COUNT(p.product_id) AS number_of_products
FROM supplier s
JOIN product p
ON s.supplier_id = p.supplier_id
GROUP BY
    s.supplier_id,
    s.supplier_name
ORDER BY
    number_of_products DESC;

/*
========================================================
SUPPLIER CATEGORY DISTRIBUTION
========================================================
Purpose:
Calculate the number of products supplied by each
supplier within every product category.

Formula:
Products per Supplier Category =
COUNT(Product ID)

Business Use:
This analysis helps RetailIQ understand supplier
specialization, identify category dependencies, and
support supplier diversification decisions.
========================================================
*/

SELECT
    s.supplier_name,
    c.category_name,
    COUNT(p.product_id) AS number_of_products
FROM supplier s
JOIN product p
ON s.supplier_id = p.supplier_id
JOIN category c
ON p.category_id = c.category_id
GROUP BY
    s.supplier_id,
    s.supplier_name,
    c.category_id,
    c.category_name
ORDER BY
    number_of_products DESC;

/*
========================================================
SUPPLIER RETURN RECORDS
========================================================
Purpose:
Calculate the number of return records associated with
each supplier.

Formula:
Supplier Return Records =
COUNT(Return ID)

Business Use:
This analysis helps RetailIQ identify suppliers whose
products generate the highest number of return records.
The results can support supplier performance reviews,
quality improvement initiatives, and procurement
decisions.

Note:
The current schema stores return records only and does
not include returned quantity. Therefore, this analysis
represents return records, not returned units.
========================================================
*/

SELECT
    s.supplier_name,
    COUNT(r.return_id) AS return_records
FROM supplier s
JOIN product p
ON s.supplier_id = p.supplier_id
JOIN returns r
ON p.product_id = r.product_id
GROUP BY
    s.supplier_id,
    s.supplier_name
ORDER BY
    return_records DESC;




