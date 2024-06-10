CREATE DATABASE store;

USE store;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    description VARCHAR(40) NOT NULL,
    -- DECIMAL(5, 2) means that the number will have a maximum of 10 digits, 2 of them will be decimals
    price DECIMAL(5, 2) NOT NULL,
    size VARCHAR(10) NOT NULL,
    color VARCHAR(15),
    stock INT
);

CREATE TABLE clients(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    address VARCHAR (50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(30)
);

CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    client_id INT NOT NULL,
    product_id INT NOT NULL,
    price DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (client_id) REFERENCES clients(id)
);


CREATE TABLE employee(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    address VARCHAR (50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(30),
    position VARCHAR(20) NOT NULL
);

INSERT INTO clients (name, last_name, address, phone_number, email) VALUES
    ('Sofia', 'Garcia', 'Madrid', '2728725', '1@gmail.com'),
    ('Mateo', 'Rodríguez', 'Barcelona', '7587575', '2@gmail.com'),
    ('Valentina', 'Martínez', 'París', '758785785', '3@gmail.com'),
    ('Santiago', 'López', 'Londres', '578578557', '4@gmail.com'),
    ('Lucia', 'González', 'NY', '578578575', '5@gmail.com'),
    ('Martin', 'Pérez', 'Tokio', '8772237', '6@gmail.com'),
    ('Isabella', 'Sánchez', 'Roma', '9554125', '7@gmail.com'),
    ('Diego', 'Romero', 'Berlín', '142765765', '8@gmail.com'),
    ('Camila', 'Díaz', 'Sídney', '254125412', '9@gmail.com'),
    ('Sebastian', 'Flores', 'Río de Janeiro', '641376297', '10@gmail.com'),
    ('Emma', 'Gómez', 'Buenos Aires', '415279821', '11@gmail.com'),
    ('Nicolas', 'Muñoz', 'Estambul', '41898279', '12@gmail.com'),
    ('Maria', 'Álvarez', 'Moscú', '4126721', '13@gmail.com'),
    ('Alejandro', 'Jiménez', 'El Cairo', '1585877', '14@gmail.com');




-- Here will be the insert statements for the tables
INSERT INTO products (name, description, price, size, color, stock) VALUES
    ('T-shirt', 'Basic white t-shirt', 10.00, 'M', 'White', 100),
    ('Jeans', 'Blue jeans', 30.00, '32', 'Blue', 50),
    ('Sneakers', 'Black sneakers', 20.00, '8', 'Black', 30),
    ('Sweater', 'Gray sweater', 25.00, 'M', 'Gray', 40),
    ('Dress', 'Red dress', 35.00, 'S', 'Red', 20),
    ('Hoodie', 'Black hoodie', 25.00, 'M', 'Black', 40),
    ('Shorts', 'Blue shorts', 15.00, 'M', 'Blue', 60),
    ('Shirt', 'White shirt', 20.00, 'M', 'White', 50),
    ('Jacket', 'Black jacket', 40.00, 'M', 'Black', 30),
    ('Skirt', 'Black skirt', 20.00, 'S', 'Black', 25),
    ('Hat', 'Black hat', 10.00, 'M', 'Black', 70),
    ('Socks', 'White socks', 5.00, 'M', 'White', 100),
    ('Gloves', 'Black gloves', 7.00, 'M', 'Black', 80),
    ('Scarf', 'Red scarf', 8.00, 'M', 'Red', 90),
    ('Belt', 'Brown belt', 12.00, 'M', 'Brown', 60),
    ('Purse', 'Black purse', 30.00, 'M', 'Black', 40),
    ('Backpack', 'Blue backpack', 25.00, 'M', 'Blue', 50),
    ('Wallet', 'Brown wallet', 15.00, 'M', 'Brown', 70),
    ('Watch', 'Black watch', 20.00, 'M', 'Black', 60),
    ('Bracelet', 'Silver bracelet', 10.00, 'M', 'Silver', 80);

SELECT * FROM products;

-- Select the products that have a price greater than 20
SELECT * FROM products WHERE price > 20;

INSERT INTO sales (client_id, product_id, price) VALUES
    ('1', 1, 10.00),
    ('2', 2, 30.00),
    ('3', 3, 20.00),
    ('4', 4, 25.00),
    ('5', 5, 35.00),
    ('6', 6, 25.00),
    ('7', 7, 15.00),
    ('8', 8, 20.00),
    ('9', 9, 40.00),
    ('9', 10, 20.00),
    ('9', 11, 10.00),
    ('10', 12, 5.00),
    ('11', 13, 7.00),
    ('11', 14, 8.00),
    ('12', 15, 12.00),
    ('12', 16, 30.00),
    ('12', 17, 25.00),
    ('12', 18, 15.00),
    ('13', 19, 20.00),
    ('14', 20, 10.00);


SELECT * FROM sales;

-- Select the sales that have a price less than 15
SELECT * FROM sales WHERE price < 15;


-- Large and more specific update
UPDATE products SET stock_quantity = 95 WHERE usuarios.name = 'T-shirt';
-- Shorter update, but the same as above
UPDATE products SET stock_quantity = 90 WHERE name = 'T-shirt';

-- Delete the product with the id 14, this a hard delete, this is a high-risk sport
DELETE FROM products WHERE id = 14 and name = 'Scarf';

-- Do a soft delete changing the status of the product to inactive
ALTER TABLE products ADD COLUMN status VARCHAR(10) DEFAULT 'active';

UPDATE products SET status = 'inactive' WHERE id = 14;
-- The same as above but using the name column
UPDATE products SET status = 'inactive' WHERE name = 'Scarf';

-- Reset the auto increment value, and now the products table will start from 1
ALTER TABLE products AUTO_INCREMENT = 1;

INSERT INTO products (name, description, price, size, color, stock_quantity) VALUES
    ('Scarf', 'Red scarf', 8.00, 'M', 'Red', 90);
