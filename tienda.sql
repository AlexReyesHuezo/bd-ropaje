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
    FOREIGN KEY (product) REFERENCES products(name)
    FOREIGN KEY (client_name) REFERENCES clients(name)
);