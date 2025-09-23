INSERT INTO customers (name, region, email, created_at) VALUES
('urban Byitingiro', 'Kigali', 'byiringirourban20@gmail.com', '2024-01-10'),
('genti Mugisha','Huye',  'mugishagentil48.com', '2024-01-05'),
('Paul Kamanzi','Kigali','paulkamanzi344.com','2024-02-01'),
('Aline Uwase','Rubavu','alineuwase34.com','2024-02-15'),
('Ahmed Musa','Kigali','ahmedmusaarmodi483.com','2024-03-02'),
('urban Byitingiro', 'Kigali', 'byiringirourban20@gmail.com', '2024-01-10'),
('genti Mugisha','Huye',  'mugishagentil48.com', '2024-01-05'),
('Paul Kamanzi','Kigali','paulkamanzi344.com','2024-02-01'),
('Aline Uwase','Rubavu','alineuwase34.com','2024-02-15'),
('Ahmed Musa','Kigali','ahmedmusaarmodi483.com','2024-03-02');
;


INSERT INTO products (name, category) VALUES
('Coffee Beans', 'Beverages'),
('shoes', 'clothes'),
('banana',   'food'),
('Sugar Pack',   'Groceries'),
('Ceramic Mug',  'Accessories'),
('Tea Leaves',   'Beverages'),
('Sugar Pack',   'Groceries'),
('Ceramic Mug',  'Accessories');

INSERT INTO transactions (customer_id, product_id, sale_date, quantity, amount) VALUES
(1,1,'2024-01-15',2,25000),
(2,2,'2024-01-20',1,15000),
(3,1,'2024-02-10',1,20000),
(4,3,'2024-02-12',5,5000),
(1,4,'2024-03-05',3,12000),
(5,1,'2024-03-10',4,48000),
(2,3,'2024-03-22',2,10000),
(3,2,'2024-04-03',1,17000),
(4,1,'2024-04-08',2,26000),
(5,3,'2024-04-20',1,2500);
