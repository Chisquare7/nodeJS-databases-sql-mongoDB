-- a. creation of all the entities

-- create table categories
CREATE TABLE categories (
	id int NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(255),
    category_image_url varchar(255),
    PRIMARY KEY (id)
);

-- create table users
CREATE TABLE users (
	id int,
    name char(255),
    address varchar(255),
    email varchar(255),
    password varchar(255),
    phone_number varchar(255),
    gender ENUM('male', 'female'),
    PRIMARY KEY (id)
);

-- create table managers
CREATE TABLE managers (
	id int,
    name char(255),
    email varchar(255),
    password varchar(255),
    phone_number varchar(255),
    gender ENUM('male', 'female'),
    PRIMARY KEY (id)
);

-- create table admin
CREATE TABLE admin (
	id int,
    name char(255),
    role ENUM('user_admin', 'management_admin'),
    PRIMARY KEY (id)
);

-- create table suppliers
CREATE TABLE suppliers (
	id int,
    name varchar(255),
    address varchar(255),
    contact_info varchar(255),
    supplier_website varchar(255),
    terms_and_conditions longtext,
    PRIMARY KEY (id)
);

-- create table items
CREATE TABLE items (
	id int NOT NULL,
    name varchar(255),
    description varchar(255),
    price int,
    size ENUM('small','medium','large'),
    quantity_in_stock int,
    reorder_level int,
    item_image_url varchar(255),
    category_id int,
    supplier_id int,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id),
    PRIMARY KEY (id)
);

-- create table orders
CREATE TABLE orders (
	id int,
    quantity int,
    order_status set('pending','in-progress','approved','cancelled','delivered','shipped','returned','out-of-stock','on-hold','disputed'),
    order_total_price int,
    payment_method ENUM('cash','wire transfer','cheque','online'),
    shipping_address varchar(255),
    order_date datetime DEFAULT CURRENT_TIMESTAMP,
    item_id int,
    user_id int,
    admin_id int,
    manager_id int,
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (admin_id) REFERENCES admin(id),
    FOREIGN KEY (manager_id) REFERENCES managers(id),
    PRIMARY KEY (id)
);

-- create table warehouses
CREATE TABLE warehouses (
	id int,
    location varchar(255),
    warehouse_capacity int,
    manager_id int,
    FOREIGN KEY (manager_id) REFERENCES managers(id),
    PRIMARY KEY (id)
);

-- create table stocks
CREATE TABLE stocks (
	id int,
    quantity int,
    last_updated datetime DEFAULT CURRENT_TIMESTAMP,
    item_id int,
    warehouse_id int,
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(id),
    PRIMARY KEY (id)
);


-- b. inserting records into the entities

-- insert into categories
-- 1.
INSERT INTO categories
(id, name, description, category_image_url)
VALUES (1, 'Clothing', 'A category of items that are worn on the body.', 'https://sample.com/clothing-category.jpg');

-- 2.
INSERT INTO categories
(id, name, description, category_image_url)
VALUES (2, 'Shoes', 'A category of items that are worn on the feet.', 'https://sample.com/shoes-category.jpg');

-- 3.
INSERT INTO categories
(id, name, description, category_image_url)
VALUES (3, 'Accessories', 'A category of items that are worn or carried with clothing.', 'https://sample.com/accessories-category.jpg');
    

-- insert into users
-- 1.
INSERT INTO users
(id, name, address, email, password, phone_number, gender)
VALUES (1, 'Donatus John', '234 Broad street, Island', 'donatus.john@sample.com', 'donatusjohn123', '234-567-8975640', 'male');

-- 2.
INSERT INTO users
(id, name, address, email, password, phone_number, gender)
VALUES (2, 'Gloria Nice', '61 Daylight street, V.I', 'gloria.nice@sample.com', 'nicegloria876', '444-876-45364208', 'female');

-- 3.
INSERT INTO users
(id, name, address, email, password, phone_number, gender)
VALUES (3, 'Phillip Iron', '546 Iron man street, Lekki', 'iron.phillip@sample.com', 'phillip.iron345', '556-876-123456709', 'male');


-- insert into managers
-- 1. 
INSERT INTO managers
(id, name, email, password, phone_number, gender)
VALUES (1, 'Winifred Johnson', 'winifred.johnson@sample.com', 'winifred657', '234-758-90864580', 'female');

-- 2.
INSERT INTO managers
(id, name, email, password, phone_number, gender)
VALUES (2, 'Hannah Oluwo', 'hannah.oluwo@sample.com', 'hannaholu908', '564-980-653474869', 'female');

-- 3.
INSERT INTO managers
(id, name, email, password, phone_number, gender)
VALUES (3, 'Adeyinka Afred', 'adeyinka.afred@sample.com', 'adeafred6745', '243-564-875645343', 'male');


-- insert into admin
-- 1.
INSERT INTO admin
(id, name, role)
VALUES (1, 'David Robert', 'management_admin');

-- 2.
INSERT INTO admin
(id, name, role)
VALUES (2, 'Tosin Kolawole', 'user_admin');

-- 3.
INSERT INTO admin
(id, name, role)
VALUES (3, 'Ayinla Olatunde', 'management_admin');


-- insert into suppliers
-- 1.
INSERT INTO suppliers
(id, name, address, contact_info, supplier_website, terms_and_conditions)
VALUES (1, 'Oak Clothings', '234 Oak Street, Clothing Village', '546-564-89647639', 'https://www.oakclothings.com', 'https://www.oakclothings.com/terms-and-conditions');

-- 2.
INSERT INTO suppliers
(id, name, address, contact_info, supplier_website, terms_and_conditions)
VALUES (2, 'Shoe Showroom', '78 Shoe Street, Shoe Village', '876-980-89647639', 'https://www.shoeshowroom.com', 'https://www.shoeshowroom.com/terms-and-conditions');

-- 3.
INSERT INTO suppliers
(id, name, address, contact_info, supplier_website, terms_and_conditions)
VALUES (3, 'Accessories Depot', '54 Accessories Street, Accessory Village', '345-765-65477639', 'https://www.accessoriesdepot.com', 'https://www.accessoriesdepot.com/terms-and-conditions');


-- insert into items
-- 1.
INSERT INTO items
(id, name, description, price, size, quantity_in_stock, reorder_level, item_image_url, category_id, supplier_id)
VALUES (1, 'Grey Shirt', 'A classic grey shirt.', '1000', 'small', 10, 5, 'https://sample.com/grey-shirt.jpg', 1, 1);

-- 2.
INSERT INTO items
(id, name, description, price, size, quantity_in_stock, reorder_level, item_image_url, category_id, supplier_id)
VALUES (2, 'Black Shoes', 'A pair of black shoes.', '5000', 'large', 25, 10, 'https://sample.com/black-shoe.jpg', 2, 2);

-- 3.
INSERT INTO items
(id, name, description, price, size, quantity_in_stock, reorder_level, item_image_url, category_id, supplier_id)
VALUES (3, 'Necklaces', 'A silver colored Necklace.', '3000', 'medium', 50, 30, 'https://sample.com/necklace.jpg', 3, 3);


-- insert into orders
-- 1.
INSERT INTO orders
(id, quantity, order_status, order_total_price, payment_method, shipping_address, order_date, item_id, user_id, admin_id, manager_id)
VALUES (1, 5, 'pending', 5000, 'cash', '234 Mapple Street, Sample Village', '2023-04-09 12:00:00', 1, 1, 1, 1);

-- 2.
INSERT INTO orders
(id, quantity, order_status, order_total_price, payment_method, shipping_address, order_date, item_id, user_id, admin_id, manager_id)
VALUES (2, 50, 'approved', 100000, 'wire transfer', '68 Oak Street, Shoe Village', '2023-02-10 01:00:00', 2, 2, 2, 2);

-- 3.
INSERT INTO orders
(id, quantity, order_status, order_total_price, payment_method, shipping_address, order_date, item_id, user_id, admin_id, manager_id)
VALUES (3, 20, 'returned', 20000, 'cheque', '676 Mupple Street, Shane Town', '2023-03-14 12:00:00', 3, 3, 3, 3);


-- insert into warehouses
-- 1.
INSERT INTO warehouses
(id, location, warehouse_capacity, manager_id)
VALUES (1, 'Warehouse Location 1', 2000, 1);

-- 2.
INSERT INTO warehouses
(id, location, warehouse_capacity, manager_id)
VALUES (2, 'Warehouse Location 2', 5000, 2);

-- 3.
INSERT INTO warehouses
(id, location, warehouse_capacity, manager_id)
VALUES (3, 'Warehouse Location 3', 7000, 3);


-- insert into stocks
-- 1.
INSERT INTO stocks
(id, quantity, last_updated, item_id, warehouse_id)
VALUES (1, 20, '2023-03-08 12:00:00', 1, 1);

-- 2.
INSERT INTO stocks
(id, quantity, last_updated, item_id, warehouse_id)
VALUES (2, 50, '2023-03-09 12:00:00', 2, 3);

-- 3.
INSERT INTO stocks
(id, quantity, last_updated, item_id, warehouse_id)
VALUES (3, 75, '2023-04-10 01:00:00', 3, 1);



-- c. Getting records from two or more entities

-- 1. Getting records from items
SELECT * FROM items;

-- 2. Getting records from orders
SELECT * FROM orders;

-- 3. Getting records from users
SELECT * FROM users;


-- d. Updating records from two or more entities

-- 1. Updating records from items
UPDATE items
SET name = 'Blue Jeans', description = 'A pair of blue jeans'
WHERE id = 1;

-- 2. Updating records from orders
UPDATE orders
SET quantity = 35, order_status = 'approved', order_total_price = 150000
WHERE id = 1;

-- 3. Updating records from users
UPDATE users
SET name = 'Mary Olayinka', email = 'mary.olayinka@sample.com', password = 'maryola2345'
WHERE id = 2;


-- e. Deleting records from two or more entities

-- 1. Deleting record from stocks
DELETE FROM stocks
WHERE id = 3;

-- 2. Deleting record from categories
DELETE FROM warehouses
WHERE manager_id = 3;