# Base de datos de tienda

decidimos crear una base de datos de tienda, donde se reciban los id de los productos, su nombre es productos, en esta tabla nos enfocamos en el todo el producto como general, nos muestra lo que es su id, su nombre, descripcion, tamaño o talla, color y cantidad en stock, su identificador principal es el id.

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

luego creamos la tabla de clientes, en esta tabla nos enfocamos principalmente como llave principal el id, y tambien recibimos nombre, apellido y las formas de buscar o contactar al cliente, como direccion, telefono y direccion electronica

CREATE TABLE clients(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    address VARCHAR (50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(30)
);


la tabla de empleados que es para almacenar los datos de los empleados, y esperamos actualizar en futuro, para que reciba cantidad vendida, y hacer metas a posterior, debido a eso pedimos su id, que seria la forma mas rapida de identificar al empleado, luego sus datos personales

CREATE TABLE employees(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    address VARCHAR (50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(30),
    position VARCHAR(20) NOT NULL
);

finalmente las ventas, que sirven para saber que productos se venden y posteriormente en actualizaciones, saber el resultado de mas vendidos, y menos vendidos, este recibe un identificador (id), que seria el codigo del recibo de venta, con el id como llave principal, sabemos el cliente, que productos llevó, su precio entre otros

CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    client_id INT NOT NULL,
    product_id INT NOT NULL,
    price DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (client_id) REFERENCES clients(id)
);


luego agregamos datos a las tablas, para revisar su funcionamiento y eso es todo, de esa manera planeamos el por que de las primary keys, y porque toman referencias de los clientes y los productos en las ventas, para poder identificarlos de manera mas efectiva.
