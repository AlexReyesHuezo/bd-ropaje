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
    stock_quantity INT
);

CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    /*
      Sales date will be saved automatically with the current date and time and the format YYYY-MM-DD HH:MM:SS
      This is done with the CURRENT_TIMESTAMP MySQL function and the TIMESTAMP data type
      I don't need to insert a value for this column, it will be done automatically
      I don't use the date data type because it doesn't have the time part
    */
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    client_name VARCHAR(25) NOT NULL,
    product VARCHAR(25) NOT NULL,
    price DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (product) REFERENCES products(name),
    FOREIGN KEY (client_name) REFERENCES clients(name)
);

-- Here will be the clients and employees tables
CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_name VARCHAR(25) NOT NULL
);

-- Here will be the insert statements for the tables
INSERT INTO products (name, description, price, size, color, stock_quantity) VALUES
    ('T-shirt', 'Basic white t-shirt', 10.00, 'M', 'White', 100),
    ('Jeans', 'Blue jeans', 30.00, '32', 'Blue', 50),
    ('Sneakers', 'Black sneakers', 20.00, '8', 'Black', 30),
    ('Sweater', 'Gray sweater', 25.00, 'M', 'Gray', 40),
    ('Dress', 'Red dress', 35.00, 'S', 'Red', 20);
    ('Hoodie', 'Black hoodie', 25.00, 'M', 'Black', 40),
    ('Shorts', 'Blue shorts', 15.00, 'M', 'Blue', 60),
    ('Shirt', 'White shirt', 20.00, 'M', 'White', 50),
    ('Jacket', 'Black jacket', 40.00, 'M', 'Black', 30),
    ('Skirt', 'Black skirt', 20.00, 'S', 'Black', 25)
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

INSERT INTO sales (client_name, product, price) VALUES
    ('Alexander Reyes', 'T-shirt', 10.00),
    ('Jesús Patiño', 'Jeans', 30.00),
    ('Genoveba Cruz', 'Sneakers', 20.00),
    ('Casingena Pineda', 'Sweater', 25.00),
    ('Carlos Venedicto', 'Dress', 35.00),
    ('Jairo Roma', 'Hoodie', 25.00),
    ('Jira Cima', 'Shorts', 15.00),
    ('Jane Doe', 'Shirt', 20.00),
    ('John Doe', 'Jacket', 40.00),
    ('Jane Doe', 'Skirt', 20.00),
    ('John Doe', 'Hat', 10.00),
    ('Jane Doe', 'Socks', 5.00),
    ('John Doe', 'Gloves', 7.00),
    ('Jane Doe', 'Scarf', 8.00),
    ('John Doe', 'Belt', 12.00),
    ('Jane Doe', 'Purse', 30.00),
    ('John Doe', 'Backpack', 25.00),
    ('Jane Doe', 'Wallet', 15.00),
    ('John Doe', 'Watch', 20.00),
    ('Jane Doe', 'Bracelet', 10.00);

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
