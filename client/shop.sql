PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS order_item; 
DROP TABLE IF EXISTS orders; 
DROP TABLE IF EXISTS favorite_products; 
DROP TABLE IF EXISTS cart_item; 
DROP TABLE IF EXISTS cart; 
DROP TABLE IF EXISTS address; 
DROP TABLE IF EXISTS card; 
DROP TABLE IF EXISTS admin; 
DROP TABLE IF EXISTS shopper; 
DROP TABLE IF EXISTS user; 
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS category; 


--create the tables
CREATE TABLE IF NOT EXISTS category(
category_id INTEGER PRIMARY KEY AUTOINCREMENT, 
--VARCHAR(20) and TEXT are used synonymously in SQLite (VAR holds max 20 char)
--decided on VARCHAR(20) to match ERD 
category_name VARCHAR(20) 
); 


CREATE TABLE IF NOT EXISTS item( 
item_id INTEGER PRIMARY KEY AUTOINCREMENT, 
sku_num INTEGER, 
--VARCHAR(25) and TEXT are used synonymously in SQLite (VAR holds max 25 char)
--decided on VARCHAR(25) to match ERD
item_name VARCHAR(25), 
quantity INTEGER, 
cost REAL, 
category_id INTEGER, 
expiration VARCHAR(20), 
FOREIGN KEY (category_id) REFERENCES category(category_id) 
);


CREATE TABLE IF NOT EXISTS user( 
user_id INTEGER PRIMARY KEY AUTOINCREMENT, 
phone_number VARCHAR(20),
first_name VARCHAR(20), 
last_name VARCHAR(20), 
email_address VARCHAR(50), 
password_hash VARCHAR(250) 
); 

CREATE TABLE  IF NOT EXISTS shopper( 
shopper_id INTEGER PRIMARY KEY, 
FOREIGN KEY (shopper_id) REFERENCES User(user_id) 
);

CREATE TABLE IF NOT EXISTS favorite_products( 
shopper_id INTEGER, 
item_id INTEGER, 
PRIMARY KEY (shopper_id, item_id), 
FOREIGN KEY (shopper_id) REFERENCES Shopper(shopper_id), 
FOREIGN KEY (item_id) REFERENCES Item(item_id) 
);

CREATE TABLE IF NOT EXISTS admin( 
admin_id INTEGER PRIMARY KEY, 
FOREIGN KEY (admin_id) REFERENCES User(user_id) 
);


CREATE TABLE IF NOT EXISTS address( 
	Shopper_id INTEGER,
address_id INTEGER PRIMARY KEY AUTOINCREMENT,   
street VARCHAR(50), 
city VARCHAR(50), 
state VARCHAR(20), 
zip_code VARCHAR(10),
FOREIGN KEY (shopper_id) REFERENCES Shopper(shopper_id)
);


CREATE TABLE IF NOT EXISTS cart ( 
	shopper_id INTEGER,
cart_id INTEGER PRIMARY KEY AUTOINCREMENT,  
FOREIGN KEY(Shopper_id) REFERENCES Shopper(shopper_id) 
);


CREATE TABLE IF NOT EXISTS cart_item( 
cart_id INTEGER, 
item_id INTEGER, 
quantity INTEGER, 
PRIMARY KEY(cart_id, item_id), 
FOREIGN KEY (cart_id) REFERENCES Cart(cart_id), 
FOREIGN KEY (item_id) REFERENCES Item(item_id) 
);


CREATE TABLE IF NOT EXISTS card( 
card_id INTEGER PRIMARY KEY AUTOINCREMENT, 
shopper_id INTEGER, 
card_dig VARCHAR(4), 
type VARCHAR(25), 
FOREIGN KEY (shopper_id) REFERENCES Shopper(shopper_id) 
);


CREATE TABLE IF NOT EXISTS orders( 
order_id INTEGER PRIMARY KEY AUTOINCREMENT, 
shopper_id INTEGER, 
card_id INTEGER, 
total REAL, 
delivery VARCHAR(50), 
FOREIGN KEY (shopper_id) REFERENCES Shopper(shopper_id), 
FOREIGN KEY (card_id) REFERENCES Card(card_id) 
);


CREATE TABLE IF NOT EXISTS order_item( 
order_id INTEGER, 
item_id INTEGER, 
quantity INTEGER,
 purchase_price REAL, 
PRIMARY KEY (order_id, item_id), 
FOREIGN KEY (order_id) REFERENCES Orders(order_id), 
FOREIGN KEY (item_id) REFERENCES Item(item_id) 
); 

-- create categories
INSERT INTO category 
(category_name) 
VALUES ('Vegetables'); 

INSERT INTO category
	(category_name)
VALUES ('Fruits');

--add items to the database
INSERT INTO item 
(item_name, sku_num, quantity, cost, category_id) 
VALUES ('Apple', 415, 10, 0.99, (SELECT category_id FROM category WHERE category_name = 'Fruits'));
 
INSERT INTO item 
(item_name, sku_num, quantity, cost, category_id) 
VALUES ('Carrots', 416, 15, 1.99, (SELECT category_id FROM category WHERE category_name = 'Vegetables'));

INSERT INTO item 
(item_name, sku_num, quantity, cost, category_id) 
VALUES ('Broccoli', 417, 20, 0.75, (SELECT category_id FROM category WHERE category_name = 'Vegetables'));

INSERT INTO item 
(item_name, sku_num, quantity, cost, category_id) 
VALUES ('Bananas', 418, 40, 0.20, (SELECT category_id FROM category WHERE category_name = 'Fruits'));

--create a cart, uses hardcoded cart id
INSERT INTO cart 
(cart_id) 
VALUES(1); 

--adding items to the cart
INSERT INTO cart_item 
(item_id, cart_id, quantity) 
VALUES ((SELECT item_id FROM item WHERE item_name = 'Carrots'), 1, 3); 


INSERT INTO cart_item 
(item_id, cart_id, quantity) 
VALUES ((SELECT item_id FROM item WHERE item_name = 'Broccoli'), 1, 5); 


INSERT INTO cart_item 
(item_id, cart_id, quantity) 
VALUES ((SELECT item_id FROM item WHERE item_name = 'Bananas'), 1, 4); 

INSERT INTO cart_item 
(item_id, cart_id, quantity) 
VALUES ((SELECT item_id FROM item WHERE item_name = 'Apple'), 1, 5);

--view cart information, uses hardcoded cart id (before cart changes)
SELECT 
cart.cart_id, 
item.item_name, 
cart_item.quantity, 
item.cost, cart_item.quantity*item.cost AS total 
FROM cart 
JOIN cart_item ON cart.cart_id = cart_item.cart_id 
JOIN item ON cart_item.item_id = item.item_id 
WHERE cart.cart_id = 1;

--change the quantity of apple 
UPDATE cart_item
SET quantity = 2
WHERE cart_id = 1 AND item_id = (SELECT item_id FROM item WHERE item_name = 'Apple');

--change quantity of carrots
UPDATE cart_item
SET quantity = 8
WHERE cart_id = 1 AND item_id = (SELECT item_id FROM item WHERE item_name = 'Carrots');

--view cart information, uses hardcoded cart id (after cart changes)
SELECT 
cart.cart_id, 
item.item_name, 
cart_item.quantity, 
item.cost, cart_item.quantity*item.cost AS total 
FROM cart 
JOIN cart_item ON cart.cart_id = cart_item.cart_id 
JOIN item ON cart_item.item_id = item.item_id 
WHERE cart.cart_id = 1;

--view all items
SELECT *
FROM item;