
-- =====================================================
-- PROJECT: E-commerce Database QA Testing
-- DIALECT: MySQL 8.0
-- DATA: Synthetic test data only
-- PURPOSE: Practice positive, negative, and edge cases
-- =====================================================

-- TABLE 1: CUSTOMERS
SET NAMES utf8mb4;
DROP TABLE IF EXISTS customers;

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

INSERT INTO customers VALUES
(0, 'Somchai Prasert', 'somchai.prasert16@outlook.com', '0959586960', 'ACTIVE', '2026-09-14'),
(-1, 'Naree Wongsakul', 'naree.wongsakul14@hotmail.com', '0988056747', 'ACTIVE', '2026-10-19'),
(2147483647, 'Anan Chaiyasit', 'anan.chaiyasit74@icloud.com', '0659236009', 'ACTIVE', '2026-10-11'),
(108, NULL, 'pimchanok.srisuk99@icloud.com', '0925025425', 'ACTIVE', '2026-04-02'),
(109, '', 'kittipong.thongdee79@gmail.com', '0825819091', 'ACTIVE', '2026-04-27'),
(209, '   ', 'supansa.rattanakorn58@gmail.com', '0659225646', 'ACTIVE', '2026-09-22'),
(111, 'A', 'nattapong.boonmee41@hotmail.com', '0915219689', 'ACTIVE', '2026-06-30'),
(112, REPEAT('A',99), 'warunee.jaidee46@yahoo.com', '0629616569', 'ACTIVE', '2026-09-12'),
(113, REPEAT('A',100), 'chaiwat.suksan10@outlook.com', '0825900991', 'ACTIVE', '2026-06-14'),
(115, '  Alice Johnson  ', 'ratchanee.phromma59@hotmail.com', '0616184138', 'ACTIVE', '2026-04-08'),
(116, 'สมชาย ใจดี', 'thanakorn.intarasut91@outlook.com', '0898735513', 'ACTIVE', '2026-07-19'),
(117, 'Sean O''Brien', 'siriporn.kaewmanee12@yahoo.com', '0989362688', 'ACTIVE', '2026-05-01'),
(118, 'x''; DROP TABLE customers;--', 'piyawat.saetang55@icloud.com', '0649238128', 'ACTIVE', '2026-07-12'),
(119, '12345', 'jirapat.chantarasri68@outlook.com', '0658045862', 'ACTIVE', '2026-08-24'),
(219, '@@@@', 'wipawee.lertsiri62@icloud.com', '0951425740', 'ACTIVE', '2026-08-27'),
(121, 'Teerapong Sirisuk', '', '0863164241', 'ACTIVE', '2026-04-14'),
(124, 'Araya Phetcharat', 'ALICE@EXAMPLE.COM', '0629778116', 'ACTIVE', '2026-09-20'),
(125, 'Pornthip Charoensuk', 'john.doe@example.com', '0828204296', 'ACTIVE', '2026-07-31'),
(126, 'Sakda Wattana', 'first.last+tag@example.co.th', '0839088515', 'ACTIVE', '2026-05-30'),
(127, 'Malee Sombat', 'aliceexample.com', '0653047042', 'ACTIVE', '2026-09-09'),
(128, 'Krit Anuwat', 'alice@', '0628663770', 'ACTIVE', '2026-09-21'),
(129, 'Napat Siriwan', '@example.com', '0925211189', 'ACTIVE', '2026-08-23'),
(130, 'Duangjai Prakobkit', 'a@@example.com', '0916161129', 'ACTIVE', '2026-08-20'),
(131, 'Ekkachai Ruangrit', 'ali ce@example.com', '0649420478', 'ACTIVE', '2026-09-27'),
(132, 'Nuttaya Khamsai', 'alice@example', '0927743569', 'ACTIVE', '2026-07-21'),
(133, 'Emily Carter', ' alice2@example.com ', '0865938778', 'ACTIVE', '2026-06-09'),
(134, 'Daniel Reyes', CONCAT('a@', REPEAT('d',60), '.', REPEAT('d',60), '.', REPEAT('d',22), '.com'), '0811555481', 'ACTIVE', '2026-05-10'),
(137, 'Sophie Laurent', 'sophie.laurent84@icloud.com', '', 'ACTIVE', '2026-07-28'),
(237, 'Marcus Webb', 'marcus.webb67@yahoo.com', '   ', 'ACTIVE', '2026-07-03'),
(139, 'Hannah Fischer', 'hannah.fischer26@outlook.com', '081-111-1111', 'ACTIVE', '2026-09-26'),
(239, 'Liam Connor', 'liam.connor63@yahoo.com', '+66811111111', 'ACTIVE', '2026-08-10'),
(339, 'Olivia Martin', 'olivia.martin99@yahoo.com', '081 111 1111', 'ACTIVE', '2026-07-22'),
(439, 'Noah Anderson', 'noah.anderson72@gmail.com', '08abc11111', 'ACTIVE', '2026-06-15'),
(140, 'Mia Tanaka', 'mia.tanaka41@yahoo.com', '0811111111', 'ACTIVE', '2026-04-27'),
(141, 'Lucas Meyer', 'lucas.meyer57@icloud.com', '081111111', 'ACTIVE', '2026-06-07'),
(241, 'Isabella Rossi', 'isabella.rossi58@hotmail.com', '08111111111', 'ACTIVE', '2026-07-19'),
(142, 'Ethan Walker', 'ethan.walker94@yahoo.com', '1811111111', 'ACTIVE', '2026-04-18'),
(143, 'Grace Kim', 'grace.kim84@outlook.com', CONCAT('0', REPEAT('8',29)), 'ACTIVE', '2026-08-07'),
(147, 'Oliver Grant', 'oliver.grant48@gmail.com', '0867900650', 'DELETED', '2026-05-09'),
(247, 'Chloe Dubois', 'chloe.dubois58@gmail.com', '0821003589', 'PENDING', '2026-07-26'),
(347, 'Henry Clarke', 'henry.clarke75@icloud.com', '0652393608', '123', '2026-09-05'),
(148, 'Zoe Patel', 'zoe.patel26@hotmail.com', '0821749254', NULL, '2026-10-11'),
(149, 'Samuel Ortiz', 'samuel.ortiz70@outlook.com', '0616993671', '', '2026-05-11'),
(249, 'Ava Mitchell', 'ava.mitchell1@outlook.com', '0619254204', '   ', '2026-09-25'),
(150, 'Jack Thompson', 'jack.thompson93@hotmail.com', '0954740105', 'active', '2026-08-01'),
(250, 'Nina Petrova', 'nina.petrova76@hotmail.com', '0989467819', 'Active', '2026-06-15'),
(151, 'Leo Schmidt', 'leo.schmidt11@yahoo.com', '0613686393', ' ACTIVE ', '2026-05-06'),
(155, 'Ruby Evans', 'ruby.evans76@outlook.com', '0957912869', 'ACTIVE', NULL),
(160, 'Adrian Costa', 'adrian.costa50@hotmail.com', '0954300029', 'ACTIVE', '2024-02-29'),
(162, 'Freya Nilsson', 'freya.nilsson49@gmail.com', '0827532175', 'ACTIVE', DATE_ADD(CURDATE(), INTERVAL 1 DAY)),
(163, 'Victor Lim', 'victor.lim10@gmail.com', '0656821993', 'ACTIVE', CURDATE());

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
