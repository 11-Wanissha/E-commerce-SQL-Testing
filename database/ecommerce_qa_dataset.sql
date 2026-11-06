-- public.categories definition

-- Drop table

-- DROP TABLE public.categories;

CREATE TABLE public.categories (
	category_id int4 NOT NULL,
	category_name varchar(100) NULL,
	CONSTRAINT categories_category_id_not_null NOT NULL category_id,
	CONSTRAINT categories_pkey PRIMARY KEY (category_id)
);


-- public.customers definition

-- Drop table

-- DROP TABLE public.customers;

CREATE TABLE public.customers (
	customer_id int4 NOT NULL,
	full_name varchar(100) NULL,
	email varchar(150) NULL,
	phone varchar(30) NULL,
	account_status varchar(20) NULL,
	created_at date NULL,
	CONSTRAINT customers_customer_id_not_null NOT NULL customer_id,
	CONSTRAINT customers_pkey PRIMARY KEY (customer_id)
);


-- public.addresses definition

-- Drop table

-- DROP TABLE public.addresses;

CREATE TABLE public.addresses (
	address_id int4 NOT NULL,
	customer_id int4 NULL,
	address_type varchar(20) NULL,
	street varchar(200) NULL,
	city varchar(100) NULL,
	postal_code varchar(10) NULL,
	is_default bool NULL,
	CONSTRAINT addresses_address_id_not_null NOT NULL address_id,
	CONSTRAINT addresses_pkey PRIMARY KEY (address_id),
	CONSTRAINT fk_addresses_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);


-- public.orders definition

-- Drop table

-- DROP TABLE public.orders;

CREATE TABLE public.orders (
	order_id int4 NOT NULL,
	customer_id int4 NULL,
	order_date date NULL,
	order_status varchar(30) NULL,
	subtotal numeric(10, 2) NULL,
	discount_amount numeric(10, 2) NULL,
	shipping_fee numeric(10, 2) NULL,
	tax_amount numeric(10, 2) NULL,
	total_amount numeric(10, 2) NULL,
	CONSTRAINT orders_order_id_not_null NOT NULL order_id,
	CONSTRAINT orders_pkey PRIMARY KEY (order_id),
	CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);


-- public.payments definition

-- Drop table

-- DROP TABLE public.payments;

CREATE TABLE public.payments (
	payment_id int4 NOT NULL,
	order_id int4 NULL,
	payment_method varchar(30) NULL,
	payment_status varchar(30) NULL,
	amount numeric(10, 2) NULL,
	transaction_ref varchar(100) NULL,
	CONSTRAINT payments_payment_id_not_null NOT NULL payment_id,
	CONSTRAINT payments_pkey PRIMARY KEY (payment_id),
	CONSTRAINT fk_payments_order FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);


-- public.products definition

-- Drop table

-- DROP TABLE public.products;

CREATE TABLE public.products (
	product_id int4 NOT NULL,
	category_id int4 NULL,
	sku varchar(50) NULL,
	product_name varchar(150) NULL,
	price numeric(10, 2) NULL,
	stock_quantity int4 NULL,
	product_status varchar(20) NULL,
	CONSTRAINT products_pkey PRIMARY KEY (product_id),
	CONSTRAINT products_product_id_not_null NOT NULL product_id,
	CONSTRAINT fk_products_category FOREIGN KEY (category_id) REFERENCES public.categories(category_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);


-- public.shipments definition

-- Drop table

-- DROP TABLE public.shipments;

CREATE TABLE public.shipments (
	shipment_id int4 NOT NULL,
	order_id int4 NULL,
	carrier varchar(50) NULL,
	tracking_number varchar(100) NULL,
	shipment_status varchar(30) NULL,
	shipped_date date NULL,
	delivered_date date NULL,
	CONSTRAINT shipments_pkey PRIMARY KEY (shipment_id),
	CONSTRAINT shipments_shipment_id_not_null NOT NULL shipment_id,
	CONSTRAINT fk_shipments_order FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);


-- public.order_items definition

-- Drop table

-- DROP TABLE public.order_items;

CREATE TABLE public.order_items (
	order_item_id int4 NOT NULL,
	order_id int4 NULL,
	product_id int4 NULL,
	quantity int4 NULL,
	unit_price numeric(10, 2) NULL,
	CONSTRAINT order_items_order_item_id_not_null NOT NULL order_item_id,
	CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id),
	CONSTRAINT fk_order_items_product FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
