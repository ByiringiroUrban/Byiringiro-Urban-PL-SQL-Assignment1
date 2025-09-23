-- customers table
CREATE TABLE customers (
  customer_id   NUMBER PRIMARY KEY,
  name          VARCHAR2(100) NOT NULL,
  region        VARCHAR2(50),
  email         VARCHAR2(100),
  created_at    DATE DEFAULT SYSDATE
);

-- products table
CREATE TABLE products (
  product_id    NUMBER PRIMARY KEY,
  name          VARCHAR2(100) NOT NULL,
  category      VARCHAR2(50)
);

-- transactions (sales) table
CREATE TABLE transactions (
  transaction_id NUMBER PRIMARY KEY,
  customer_id    NUMBER NOT NULL,
  product_id     NUMBER NOT NULL,
  sale_date      DATE NOT NULL,
  quantity       NUMBER DEFAULT 1,
  amount         NUMBER(12,2) NOT NULL,
  CONSTRAINT fk_trans_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  CONSTRAINT fk_trans_product  FOREIGN KEY (product_id) REFERENCES products(product_id)
);