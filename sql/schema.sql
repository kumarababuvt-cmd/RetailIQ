/*
========================================================
RetailIQ Database Schema
Author : Kumara Babu
Project : RetailIQ
Database : MySQL 8.0
Description:
This script creates the complete RetailIQ database
including all master, inventory, and transaction tables.
========================================================
*/

CREATE DATABASE IF NOT EXISTS retailiq;

USE retailiq;

/*

========================================================
CATEGORY TABLE
Description:
Stores the product categories available in RetailIQ.
========================================================
*/

CREATE TABLE category (
    category_id INT NOT NULL,
    category_name VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL,

    PRIMARY KEY (category_id),
    UNIQUE (category_name)
);

/*
========================================================
SUPPLIER TABLE
Description:
Stores supplier information and performance metrics,
including product quality, on-time delivery rating,
and total deliveries completed.
========================================================
*/

CREATE TABLE supplier (
    supplier_id INT NOT NULL,
    supplier_name VARCHAR(50) NOT NULL,
    product_quality INT NOT NULL,
    correct_time_delivery_rating INT NOT NULL,
    total_deliveries INT NOT NULL DEFAULT 0,

    PRIMARY KEY (supplier_id)
);

/*
========================================================
WAREHOUSE TABLE
Description:
Stores warehouse information including warehouse name,
location, and storage capacity.
========================================================
*/

CREATE TABLE warehouse (
    warehouse_id INT NOT NULL,
    warehouse_location VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    warehouse_name VARCHAR(75),

    PRIMARY KEY (warehouse_id),
    UNIQUE (warehouse_name),
    CHECK (capacity > 0)
);

/*
========================================================
STORE TABLE
Description:
Stores retail store information including contact details,
storage capacity, operational status, and location.
========================================================
*/

CREATE TABLE store (
    store_id INT NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL,
    store_capacity INT NOT NULL,
    status BOOLEAN NOT NULL,
    store_location VARCHAR(100),

    PRIMARY KEY (store_id),
    UNIQUE (phone_number),
    UNIQUE (email),
    CHECK (store_capacity > 0)
);

/*
========================================================
CUSTOMER TABLE
Description:
Stores customer information including personal details,
contact information, registration date, loyalty level,
and account status.
========================================================
*/

CREATE TABLE customer (
    customer_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    city VARCHAR(25) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL,
    registration_date DATE NOT NULL,
    loyalty_level INT NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,

    PRIMARY KEY (customer_id),
    UNIQUE (phone_number),
    UNIQUE (email),

    CHECK (gender IN ('male', 'female')),
    CHECK (loyalty_level BETWEEN 1 AND 5)
);

/*
========================================================
EMPLOYEE TABLE
Description:
Stores employee information including personal details,
job role, assigned store, salary, and employment status.
========================================================
*/

CREATE TABLE employee (
    employee_id INT NOT NULL,
    employee_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    work_category VARCHAR(50) NOT NULL,
    store_id INT,
    joining_date DATE NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,

    PRIMARY KEY (employee_id),
    UNIQUE (phone_number),
    UNIQUE (email),

    FOREIGN KEY (store_id) REFERENCES store(store_id),

    CHECK (salary > 0)
);

/*
========================================================
PRODUCT TABLE
Description:
Stores product catalog information including category,
brand, pricing, manufacturing details, SKU, supplier,
and product availability.
========================================================
*/

CREATE TABLE product (
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    brand VARCHAR(50) NOT NULL,
    cost_price DECIMAL(10,2) NOT NULL,
    selling_price DECIMAL(10,2) NOT NULL,
    manufacture_date DATE NOT NULL,
    sku VARCHAR(20),
    model VARCHAR(100),
    status VARCHAR(20),
    supplier_id INT,

    PRIMARY KEY (product_id),

    FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id),

    CHECK (cost_price > 0),
    CHECK (selling_price > 0)
);

/*
========================================================
ORDERS TABLE
Description:
Stores customer order transactions including the order
date, customer, store, and employee responsible for
processing the order.
========================================================
*/

CREATE TABLE orders (
    order_id INT NOT NULL,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    store_id INT NOT NULL,
    employee_id INT NOT NULL,

    PRIMARY KEY (order_id),

    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (store_id) REFERENCES store(store_id),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

/*
========================================================
ORDER ITEMS TABLE
Description:
Stores the individual products included in each customer
order, along with the quantity purchased and unit price
at the time of purchase.
========================================================
*/

CREATE TABLE order_items (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (order_id, product_id),

    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id),

    CHECK (quantity >= 1),
    CHECK (unit_price >= 0)
);

/*
========================================================
PAYMENTS TABLE
Description:
Stores payment information for customer orders,
including payment method, amount, payment date,
and payment status.
========================================================
*/

CREATE TABLE payments (
    payment_id INT NOT NULL,
    order_id INT,
    payment_type VARCHAR(10) NOT NULL,
    payment_amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_status VARCHAR(20) NOT NULL,

    PRIMARY KEY (payment_id),
    UNIQUE (order_id),

    FOREIGN KEY (order_id) REFERENCES orders(order_id),

    CHECK (payment_type IN ('UPI', 'CARD', 'CASH')),
    CHECK (payment_amount >= 0)
);

/*
========================================================
RETURNS TABLE
Description:
Stores returned products, including the associated order,
product, return date, inspection status, and return type.
========================================================
*/

CREATE TABLE returns (
    return_id INT NOT NULL,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    return_date DATE NOT NULL,
    inspection_status VARCHAR(20) NOT NULL,
    return_type VARCHAR(20) NOT NULL,

    PRIMARY KEY (return_id),

    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id),

    CHECK (return_type IN ('REFUND', 'REPLACEMENT'))
);

/*
========================================================
WAREHOUSE INVENTORY TABLE
Description:
Tracks the inventory quantity of each product available
in every warehouse.
========================================================
*/

CREATE TABLE warehouse_inventory (
    warehouse_id INT NOT NULL,
    product_id INT NOT NULL,
    current_quantity INT NOT NULL DEFAULT 0,

    PRIMARY KEY (warehouse_id, product_id),

    FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id),

    CHECK (current_quantity >= 0)
);

/*
========================================================
STORE INVENTORY TABLE
Description:
Tracks the inventory quantity of each product available
at every retail store.
========================================================
*/

CREATE TABLE store_inventory (
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0,

    PRIMARY KEY (store_id, product_id),

    FOREIGN KEY (store_id) REFERENCES store(store_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id),

    CHECK (quantity >= 0)
);
