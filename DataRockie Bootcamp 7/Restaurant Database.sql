CREATE TABLE IF NOT EXISTS customers (
  customer_id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT UNIQUE,
  phone TEXT
);

CREATE TABLE IF NOT EXISTS orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER,
  order_date TEXT NOT NULL,
  total_price REAL NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE IF NOT EXISTS menu_items (
  item_id INTEGER PRIMARY KEY,
  item_name TEXT NOT NULL,
  price REAL NOT NULL
);

CREATE TABLE IF NOT EXISTS order_items (
  order_item_id INTEGER PRIMARY KEY,
  order_id INTEGER,
  item_id INTEGER,
  quantity INTEGER NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);

CREATE TABLE IF NOT EXISTS employees (
  employee_id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  position TEXT NOT NULL,
  hire_date TEXT NOT NULL,
  salary REAL NOT NULL
);

INSERT INTO customers VALUES
	  (1, 'Khvicha', 'Kvaratskhelia', 'kvacha.k@hotmail.com', '+995-32-0001'),
    (2, 'Victor', 'Osimhen', 'victor.o@yahoo.com', '+234-1111-2222'),
    (3, 'Erling', 'Håland', 'erling.h@gmail.com', '+47-401-08-881'),
    (4, 'Charlie', 'Patino', 'charlie.p@hotmail.com', '+44-7525-857170'),
    (5, 'Mykhailo', 'Mudryk', 'mykhailo.m@yahoo.com', '+380-39-347-1002'),
    (6, 'Kaoru', 'Mitoma', 'kaoru.m@gmail.com', '+81-90-8134-3590'),
    (7, 'Endrick', 'Felipe', 'endrick.f@hotmail.com', '+55-45-7329-1369'),
    (8, 'Dušan', 'Vlahović', 'dusan.v@yahoo.com', '+381-61-881676'),
    (9, 'Isaac', 'Babadi', 'isaac.b@gmail.com', '+31-6-13475992');

INSERT INTO menu_items VALUES
	  (1, 'Double-Double Burger', 3.45),
    (2, 'Cheeseburger', 2.40),
    (3, 'Hamburger', 2.10),
    (4, 'French Fries', 1.60),
    (5, 'Soft Drink Extra', 2.45),
    (6, 'Shakes', 2.15),
    (7, 'Milk', 0.99),
    (8, 'Coffee', 1.35);

INSERT INTO employees VALUES
	  (1, 'James', 'Hilson', 'Dishwasher', '2021-01-01', 25350.00),
    (2, 'Zach', 'Awe', 'Dishwasher', '2021-01-01', 26350.50),
    (3, 'Henry', 'Jeffcott', 'Waiter', '2021-01-01', 27350.00),
    (4, 'James', 'Sweet', 'Waiter', '2021-01-01', 28350.50),
    (5, 'Mauro', 'Bandeira', 'Head Chef', '2021-01-01', 50160.10),
    (6, 'Catalin', 'Cirjan', 'Sous Chef', '2021-01-01', 42662.35),
    (7, 'Jack', 'Henry-Francis', 'Sous Chef', '2021-01-01', 42880.42),
    (8, 'Salah-Eddine', "Oulad M'Hand", 'Chef', '2021-01-01', 34850.00),
    (9, 'George', 'Lewis', 'Chef', '2021-01-01', 36753.69),
    (10, 'Omar', 'Rekik', 'Bartender', '2021-01-01', 31574.76),
    (11, 'Marcelo', 'Flores', 'Manager', '2021-01-01', 55000.00);

INSERT INTO orders VALUES
	  (1, 2, '2022-03-01', 5.60),
    (2, 4, '2022-03-01', 10.04),
    (3, 6, '2022-03-01', 7.77),
    (4, 8, '2022-03-02', 16.49),
    (5, 1, '2022-03-02', 12.90),
    (6, 3, '2022-03-03', 3.14),
    (7, 5, '2022-03-04', 6.15),
    (8, 7, '2022-03-05', 12.74),
    (9, 9, '2022-03-06', 6.15),
    (10, 9, '2022-03-18', 10.54),
    (11, 4, '2022-03-19', 3.45),
    (12, 5, '2022-03-20', 5.94);

INSERT INTO order_items VALUES
	  (1, 1, 1, 1),
    (2, 1, 6, 1),
    (3, 2, 1, 2),
    (4, 2, 6, 1),
    (5, 2, 7, 1),
    (6, 3, 4, 3),
    (7, 3, 7, 3),
    (8, 4, 1, 1),
    (9, 4, 2, 1),
    (10, 4, 3, 1),
    (11, 4, 4, 1),
    (12, 4, 5, 1),
    (13, 4, 6, 1),
    (14, 4, 7, 1),
    (15, 4, 8, 1),
    (16, 5, 2, 2),
    (17, 5, 4, 2),
    (18, 5, 5, 2),
    (19, 6, 6, 1),
    (20, 6, 7, 1),
    (21, 7, 3, 1),
    (22, 7, 4, 1),
    (23, 7, 5, 1),
    (24, 8, 1, 1),
    (25, 8 ,2, 1),
    (26, 8, 4, 1),
    (27, 8, 6, 2),
    (28, 8, 7, 1),
    (29, 9, 3, 1),
    (30, 9, 4, 1),
    (31, 9, 5, 1),
    (32, 10, 1, 1),
    (33, 10, 2, 1),
    (34, 10, 3, 1),
    (35, 10, 4, 1),
    (36, 10, 7, 1),
    (37, 11, 1, 1),
    (38, 12, 7, 6);

SELECT * FROM employees;
SELECT * FROM customers;

WITH sub AS (
  	SELECT 
		  customers.first_name || ' ' || customers.last_name AS fullName,
    	orders.order_date 								 AS date,
    	orders.total_price 								 AS price
	  FROM customers
	  JOIN orders ON customers.customer_id = orders.customer_id
	  ORDER BY price DESC
)
SELECT fullName, price FROM sub
WHERE date BETWEEN '2022-03-18' AND '2022-03-20';

SELECT
	  menu,
	  ROUND(SUM(price), 2)	AS SUM,
    ROUND(AVG(total), 2)	AS AVG
FROM (
  	SELECT
		  order_items.order_id		   ,
		  order_items.quantity	AS quan,
    	menu_items.item_name	AS menu,
    	menu_items.price		AS price,
    	orders.total_price		AS total
	  FROM order_items
	  JOIN orders 	ON order_items.order_id = orders.order_id
	  JOIN menu_items	ON order_items.item_id = menu_items.item_id
)
GROUP BY menu;

SELECT * FROM (
	SELECT
		ROW_NUMBER() OVER(PARTITION BY position 
                      ORDER BY first_name) 	AS rowNum,
		first_name || ' ' || last_name 		AS fullName, 
    	position 
	FROM employees
)
WHERE rowNum = 2;
