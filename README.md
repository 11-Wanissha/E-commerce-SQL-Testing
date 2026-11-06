# E-commerce-SQL-Testing

This project is a manual SQL test suite that checks whether the e-commerce PostgreSQL database blocks bad data. Each case inserts invalid or boundary-value data and checks whether the database rejects or accepts it. There are 72 test cases across 4 tables.

customers (44 cases): NULL and empty values, data types, name and email length limits (100/101 and 150/151 characters), email and phone format, duplicates, and allowed status values. It also covers Thai names and SQL-injection text.
orders (9 cases): the customer must exist, unsupported status, negative amounts, discount greater than subtotal, and total = subtotal − discount + shipping + tax.
payments (10 cases): the order must exist, negative or zero amount, amount that differs from the order total, duplicate transaction ref, and payment on a cancelled order.
shipments (9 cases): missing or duplicate tracking number, shipped/delivered date order, unsupported status, and a shipment for a cancelled order.

Results: Pass 25, Fail 47 Most failures come from the database accepting invalid data because the NOT NULL, CHECK and UNIQUE constraints and the cross-table rules are missing.
