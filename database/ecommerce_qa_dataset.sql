
-- =====================================================
-- PROJECT: E-commerce Database QA Testing
-- DIALECT: MySQL 8.0
-- DATA: Synthetic test data only
-- PURPOSE: Practice positive, negative, and edge cases
-- =====================================================

-- TABLE 1: CUSTOMERS
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(150),
    phone VARCHAR(30),
    account_status VARCHAR(20),
    created_at DATE
);

INSERT INTO customers VALUES
(1, 'Alice Johnson', 'alice@example.com', '0811111111', 'ACTIVE', '2026-01-10'),
(2, 'Ben Smith', 'ben@example.com', '0822222222', 'ACTIVE', '2026-02-15'),
(3, 'Chloe Brown', 'alice@example.com', '0833333333', 'ACTIVE', '2026-03-01'),
(4, 'Daniel Lee', NULL, '0844444444', 'ACTIVE', '2026-03-10'),
(5, 'Emma Wilson', 'emma@example.com', '0855555555', 'INACTIVE', '2026-04-20'),
(6, 'Farah Khan', 'farah@example.com', NULL, 'ACTIVE', '2026-05-05'),
(7, 'George Miller', '   ', '0877777777', 'ACTIVE', '2026-06-12'),
(8, 'Hana Davis', 'hana@example.com', '0888888888', 'SUSPENDED', '2026-07-01');

-- TABLE 2: ADDRESSES
CREATE TABLE addresses (
    address_id INT PRIMARY KEY,
    customer_id INT,
    address_type VARCHAR(20),
    street VARCHAR(200),
    city VARCHAR(100),
    postal_code VARCHAR(10),
    is_default BOOLEAN
);

INSERT INTO addresses VALUES
(101, 1, 'SHIPPING', '12 Sukhumvit Road', 'Bangkok', '10110', 1),
(102, 2, 'SHIPPING', '88 Rama IX Road', 'Bangkok', '10310', 1),
(103, 3, 'SHIPPING', '25 Nimman Road', 'Chiang Mai', '50200', 1),
(104, 4, 'SHIPPING', '40 Beach Road', 'Chonburi', '20150', 1),
(105, 5, 'SHIPPING', '9 Silom Road', 'Bangkok', '10500', 1),
(106, 99, 'SHIPPING', 'Unknown Address', 'Bangkok', '10100', 1),
(107, 6, 'SHIPPING', '', 'Bangkok', '', 1),
(108, 1, 'SHIPPING', '99 Sathorn Road', 'Bangkok', '10120', 1);

-- TABLE 3: CATEGORIES
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Home & Living'),
(3, 'Fashion'),
(4, 'Accessories');

-- TABLE 4: PRODUCTS
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    category_id INT,
    sku VARCHAR(50),
    product_name VARCHAR(150),
    price DECIMAL(10,2),
    stock_quantity INT,
    product_status VARCHAR(20)
);

INSERT INTO products VALUES
(201, 1, 'ELEC-001', 'Wireless Keyboard', 100.00, 50, 'ACTIVE'),
(202, 1, 'ELEC-002', 'Wireless Mouse', 50.00, 100, 'ACTIVE'),
(203, 1, 'ELEC-003', '4K Monitor', 1200.00, 15, 'ACTIVE'),
(204, 2, 'HOME-001', 'Desk Lamp', 80.00, 25, 'ACTIVE'),
(205, 3, 'FASH-001', 'Cotton T-Shirt', 25.00, 200, 'ACTIVE'),
(206, 4, 'ACC-001', 'Phone Case', 40.00, 0, 'ACTIVE'),
(207, 1, 'ELEC-004', 'USB Hub', 60.00, -5, 'ACTIVE'),
(208, 2, 'HOME-002', 'Office Chair', 300.00, 10, 'ACTIVE'),
(209, 3, 'FASH-002', 'Jacket', -20.00, 30, 'ACTIVE'),
(210, 4, 'ACC-002', 'Water Bottle', NULL, 40, 'ACTIVE'),
(211, 999, 'UNKNOWN-001', 'Unknown Category Product', 75.00, 5, 'ACTIVE'),
(212, 2, 'HOME-003', 'Duplicate SKU Product', 45.00, 12, 'ACTIVE'),
(213, 3, 'HOME-003', 'Another Duplicate SKU', 55.00, 8, 'ACTIVE');

-- TABLE 5: ORDERS
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    subtotal DECIMAL(10,2),
    discount_amount DECIMAL(10,2),
    shipping_fee DECIMAL(10,2),
    tax_amount DECIMAL(10,2),
    total_amount DECIMAL(10,2)
);

INSERT INTO orders (
    order_id, customer_id, order_date, order_status,
    subtotal, discount_amount, shipping_fee,
    tax_amount, total_amount
) VALUES
-- Valid reference record
(1012, 1, '2026-10-20', 'PROCESSING',
 100.00, 10.00, 30.00, 0.00, 120.00),

-- Negative: discount exceeds subtotal
(1013, 2, '2026-10-20', 'PENDING',
 100.00, 150.00, 30.00, 0.00, -20.00),

-- Negative: negative subtotal and total
(1014, 3, '2026-10-21', 'PENDING',
 -50.00, 0.00, 30.00, 0.00, -20.00),

-- Negative: customer does not exist
(1015, 999, '2026-10-21', 'PENDING',
 50.00, 0.00, 30.00, 0.00, 80.00),

-- Negative: unsupported order status
(1016, 4, '2026-10-22', 'IN_TRANSIT',
 50.00, 0.00, 30.00, 0.00, 80.00),

-- Negative: missing customer and status
(1017, NULL, '2026-10-22', NULL,
 60.00, 0.00, 30.00, 0.00, 90.00),

-- Negative: negative shipping fee
(1018, 5, '2026-10-23', 'PROCESSING',
 100.00, 0.00, -10.00, 0.00, 90.00),

-- Negative: total does not match calculation
(1019, 6, '2026-10-23', 'PENDING',
 100.00, 0.00, 30.00, 0.00, 150.00),

-- Negative: cancelled order that has a payment and shipment
(1020, 5, '2026-10-24', 'CANCELLED',
 40.00, 0.00, 30.00, 0.00, 70.00);
 
-- TABLE 6: ORDER ITEMS
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2)
);

INSERT INTO order_items VALUES
(1, 1001, 201, 2, 100.00),
(2, 1001, 202, 1, 50.00),
(3, 1002, 203, 1, 1200.00),
(4, 1003, 204, 1, 80.00),
(5, 1004, 205, 2, 25.00),
(6, 1005, 201, 1, 100.00),
(7, 1006, 202, 1, 50.00),
(8, 1007, 208, 1, 300.00),
(9, 1008, 206, 1, 40.00),
(10, 1009, 202, -1, 50.00),
(11, 1010, 207, 1, 60.00),
(12, 1011, 999, 1, 75.00),
(13, 1001, 201, 0, 100.00);

-- TABLE 7: PAYMENTS
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),
    amount DECIMAL(10,2),
    transaction_ref VARCHAR(100)
);

INSERT INTO payments (
    payment_id, order_id, payment_method,
    payment_status, amount, transaction_ref
) VALUES
-- Valid reference payment
(5012, 1012, 'CREDIT_CARD', 'PAID',
 120.00, 'TXN-NEW-5012'),

-- Negative: negative payment amount
(5013, 1013, 'CREDIT_CARD', 'PAID',
 -20.00, 'TXN-NEW-5013'),

-- Negative: zero amount marked as paid
(5014, 1014, 'BANK_TRANSFER', 'PAID',
 0.00, 'TXN-NEW-5014'),

-- Negative: unsupported payment status
(5015, 1015, 'CREDIT_CARD', 'SUCCESS',
 80.00, 'TXN-NEW-5015'),

-- Negative: missing payment method
(5016, 1016, NULL, 'PAID',
 80.00, 'TXN-NEW-5016'),

-- Negative: missing amount and transaction reference
(5017, 1017, 'CREDIT_CARD', 'PAID',
 NULL, NULL),

-- Negative: payment amount differs from order total
(5018, 1019, 'CREDIT_CARD', 'PAID',
 999.00, 'TXN-NEW-5018'),

-- Negative: duplicate transaction reference
(5019, 1019, 'CREDIT_CARD', 'PAID',
 120.00, 'TXN-NEW-5012'),

-- Negative: cancelled order marked as paid
(5020, 1020, 'CREDIT_CARD', 'PAID',
 70.00, 'TXN-NEW-5020'),

-- Negative: payment references nonexistent order
(5021, 9999, 'CREDIT_CARD', 'PAID',
 50.00, 'TXN-NEW-5021');

-- TABLE 8: SHIPMENTS
CREATE TABLE shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT,
    carrier VARCHAR(50),
    tracking_number VARCHAR(100),
    shipment_status VARCHAR(30),
    shipped_date DATE,
    delivered_date DATE
);

INSERT INTO shipments (
    shipment_id, order_id, carrier, tracking_number,
    shipment_status, shipped_date, delivered_date
) VALUES
-- Valid reference shipment
(7007, 1012, 'DHL', 'DHL-NEW-7007',
 'IN_TRANSIT', '2026-10-21', NULL),

-- Negative: missing tracking number
(7008, 1013, 'DHL', NULL,
 'IN_TRANSIT', '2026-10-21', NULL),

-- Negative: delivered but missing shipment dates
(7009, 1014, 'KERRY', 'KRY-NEW-7009',
 'DELIVERED', NULL, NULL),

-- Negative: delivery date is earlier than shipping date
(7010, 1015, 'DHL', 'DHL-NEW-7010',
 'DELIVERED', '2026-10-24', '2026-10-22'),

-- Negative: unsupported shipment status
(7011, 1016, 'DHL', 'DHL-NEW-7011',
 'WAITING', '2026-10-23', NULL),

-- Negative: shipment references nonexistent order
(7012, 9999, 'DHL', 'DHL-NEW-7012',
 'IN_TRANSIT', '2026-10-23', NULL),

-- Negative: shipment exists for a cancelled order
(7013, 1020, 'KERRY', 'KRY-NEW-7013',
 'DELIVERED', '2026-10-24', '2026-10-25'),

-- Negative: delivered date exists but shipped date is missing
(7014, 1019, 'DHL', 'DHL-NEW-7014',
 'DELIVERED', NULL, '2026-10-25'),

-- Negative: duplicate tracking number
(7015, 1018, 'DHL', 'DHL-NEW-7007',
 'IN_TRANSIT', '2026-10-24', NULL);
