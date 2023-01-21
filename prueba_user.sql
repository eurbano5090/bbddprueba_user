CREATE TABLE CLIENTE(
id_cliente NUMBER primary KEY,
nombre VARCHAR2(50),
rut NUMBER,
direccion VARCHAR2(50)
);
CREATE TABLE CATEGORIA(
id_categoria NUMBER primary KEY,
categoria VARCHAR2(50),
descripcion VARCHAR2(150)
);
CREATE TABLE PRODUCTO(
id_producto NUMBER primary KEY,
nombre_producto VARCHAR2(50),
descripcion VARCHAR2(50),
valor_unitario NUMBER,
id_categoria NUMBER,
FOREIGN KEY (id_categoria) REFERENCES CATEGORIA (id_categoria)
);
CREATE TABLE FACTURA(
id_factura NUMBER primary KEY,
id_cliente NUMBER,
fecha DATE,
subtotal NUMBER,
FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id_cliente)
);
CREATE TABLE PRODUCTO_FACTURA(
id_producto NUMBER,
id_factura NUMBER,
CANTIDAD NUMBER,
FOREIGN KEY(id_factura) REFERENCES FACTURA (id_factura),
FOREIGN KEY (id_producto) REFERENCES PRODUCTO (id_producto)
);
---CREACION SECUENCIAS DE AUMENTO DE PRIMARY KEY--
CREATE SEQUENCE cliente_id_seq
INCREMENT BY 1
START WITH 1
MINVALUE 0
NOMAXVALUE;

CREATE SEQUENCE categoria_id_seq
INCREMENT BY 1
START WITH 1
MINVALUE 0
NOMAXVALUE;

CREATE SEQUENCE producto_id_seq
INCREMENT BY 1
START WITH 1
MINVALUE 0
NOMAXVALUE;

CREATE SEQUENCE factura_id_seq
INCREMENT BY 1
START WITH 1
MINVALUE 0
NOMAXVALUE;
---Se debe crear el modelo en la base de datos, en una base de datos llamada prueba e
---insertar los siguientes registros:
---5 clientes
INSERT INTO CLIENTE (id_cliente,nombre,rut,direccion)
VALUES (CLIENTE_ID_SEQ.nextval,'nombrecliente1',10090000,'direccioncliente1');

INSERT INTO CLIENTE (id_cliente,nombre,rut,direccion)
VALUES (CLIENTE_ID_SEQ.nextval,'nombrecliente2',10080000,'direccioncliente2');

INSERT INTO CLIENTE (id_cliente,nombre,rut,direccion)
VALUES (CLIENTE_ID_SEQ.nextval,'nombrecliente3',10070000,'direccioncliente3');

INSERT INTO CLIENTE (id_cliente,nombre,rut,direccion)
VALUES (CLIENTE_ID_SEQ.nextval,'nombrecliente4',10060000,'direccioncliente4');

INSERT INTO CLIENTE (id_cliente,nombre,rut,direccion)
VALUES (CLIENTE_ID_SEQ.nextval,'nombrecliente5',10050000,'direccioncliente5');

--3 categorias.
INSERT INTO CATEGORIA (id_categoria,categoria,descripcion)
VALUES (categoria_id_seq.nextval,'categoria1','descripcioncategoria1');

INSERT INTO CATEGORIA (id_categoria,categoria,descripcion)
VALUES (categoria_id_seq.nextval,'categoria2','descripcioncategoria2');

INSERT INTO CATEGORIA (id_categoria,categoria,descripcion)
VALUES (categoria_id_seq.nextval,'categoria3','descripcioncategoria3');

---8 productos
INSERT INTO PRODUCTO (id_producto,nombre_producto,descripcion,valor_unitario,id_categoria)
VALUES (producto_id_seq.nextval,'producto1','descripcion1',300,1);
INSERT INTO PRODUCTO (id_producto,nombre_producto,descripcion,valor_unitario,id_categoria)
VALUES (producto_id_seq.nextval,'producto2','descripcion2',300,3);
INSERT INTO PRODUCTO (id_producto,nombre_producto,descripcion,valor_unitario,id_categoria)
VALUES (producto_id_seq.nextval,'producto3','descripcion3',300,1);
INSERT INTO PRODUCTO (id_producto,nombre_producto,descripcion,valor_unitario,id_categoria)
VALUES (producto_id_seq.nextval,'producto4','descripcion4',300,2);
INSERT INTO PRODUCTO (id_producto,nombre_producto,descripcion,valor_unitario,id_categoria)
VALUES (producto_id_seq.nextval,'producto5','descripcion5',300,3);
INSERT INTO PRODUCTO (id_producto,nombre_producto,descripcion,valor_unitario,id_categoria)
VALUES (producto_id_seq.nextval,'producto6','descripcion6',300,1);
INSERT INTO PRODUCTO (id_producto,nombre_producto,descripcion,valor_unitario,id_categoria)
VALUES (producto_id_seq.nextval,'producto7','descripcion7',300,2);
INSERT INTO PRODUCTO (id_producto,nombre_producto,descripcion,valor_unitario,id_categoria)
VALUES (producto_id_seq.nextval,'producto8','descripcion8',300,3);
commit;
--10 facturas.
-- 2 para el cliente 1, con 2 y 3 productos

INSERT INTO FACTURA (id_factura,id_cliente,fecha)
VALUES (factura_id_seq.nextval,1,to_date('2020-09-23','yyyy-mm-dd'));
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (1,1,1);
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (2,1,1);

UPDATE FACTURA
SET subtotal = 600
WHERE id_factura =19;

INSERT INTO FACTURA (id_factura,id_cliente,fecha)
VALUES (factura_id_seq.nextval,1,to_date('2020-09-26','yyyy-mm-dd'));
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (2,2,1);
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (3,2,2);
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (5,2,1);

UPDATE FACTURA
SET subtotal = 1200
WHERE id_factura = 20;
--- 3 para el cliente 2, con 3, 2 y 3 productos.
INSERT INTO FACTURA (id_factura,id_cliente,fecha)
VALUES (factura_id_seq.nextval,2,to_date('2019-09-13','yyyy-mm-dd'));
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (1,3,1);
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (2,3,1);
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (2,3,1);

UPDATE FACTURA
SET subtotal = 1200
WHERE id_factura = 21;

INSERT INTO FACTURA (id_factura,id_cliente,fecha)
VALUES (factura_id_seq.nextval,2,to_date('2019-09-13','yyyy-mm-dd'));
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (6,22,1);
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (7,22,3);

UPDATE FACTURA
SET subtotal = 1200
WHERE id_factura = 22;

INSERT INTO FACTURA (id_factura,id_cliente,fecha)
VALUES (factura_id_seq.nextval,2,to_date('2021-06-25','yyyy-mm-dd'));
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (1,23,1);
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (2,23,1);
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (3,23,1);
UPDATE FACTURA
SET subtotal = 900
WHERE id_factura = 23;
commit;
-- 1 para el cliente 3, con 1 producto
INSERT INTO FACTURA (id_factura,id_cliente,fecha)
VALUES (factura_id_seq.nextval,3,to_date('2019-10-13','yyyy-mm-dd'));
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (6,24,1);

UPDATE FACTURA
SET subtotal = 1200
WHERE id_factura = 24;

--4 para el cliente 4, con 2, 3, 4 y 1 producto
INSERT INTO FACTURA (id_factura,id_cliente,fecha)
VALUES (factura_id_seq.nextval,4,to_date('2016-12-03','yyyy-mm-dd'));
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (8,25,1);
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (7,25,5);

UPDATE FACTURA
SET subtotal = 1800
WHERE id_factura = 25;

INSERT INTO FACTURA (id_factura,id_cliente,fecha)
VALUES (factura_id_seq.nextval,4,to_date('2017-12-03','yyyy-mm-dd'));
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (8,26,1);
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (2,26,1);
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (1,26,1);

UPDATE FACTURA
SET subtotal = 900
WHERE id_factura = 26;

rollback;

INSERT INTO FACTURA (id_factura,id_cliente,fecha)
VALUES (factura_id_seq.nextval,4,to_date('2017-12-03','yyyy-mm-dd'));
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (8,27,1);
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (2,27,1);
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (7,27,2);
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (1,27,1);

UPDATE FACTURA
SET subtotal = 1500
WHERE id_factura = 27;

INSERT INTO FACTURA (id_factura,id_cliente,fecha)
VALUES (factura_id_seq.nextval,4,to_date('2019-10-13','yyyy-mm-dd'));
INSERT INTO PRODUCTO_FACTURA (id_producto,id_factura,cantidad)
VALUES (1,28,1);

UPDATE FACTURA
SET subtotal = 300
WHERE id_factura = 28;

COMMIT;
--- Documentar el diccionario de datos del modelo creado, señalando: El nombre de la
---tabla, identificador, nombre de la columna, tipo de dato, largo.

SELECT a.table_name AS nombre_tabla,
       a.column_id AS identificador,
       a.column_name AS nombre_columna,
       a.data_type AS tipo_dato,
       a.data_length AS largo
       
FROM USER_TAB_COLUMNS a;

commit;
--- ¿Qué cliente realizó la compra más cara?
SELECT NOMBRE FROM CLIENTE
WHERE id_cliente in (SELECT id_cliente from factura where (subtotal) in (SELECT MAX (subtotal)from factura));

---SELECT id_cliente from factura where (subtotal) in (SELECT MAX (subtotal)from factura);
---SELECT MAX (subtotal)from factura;---verificacion de querys

--- ¿Qué cliente pagó sobre 1000 de monto?
SELECT NOMBRE FROM CLIENTE
WHERE id_cliente in (select id_cliente from factura where (subtotal > 1000));

----select id_cliente from factura where (subtotal > 1000);

--- ¿Cuántos clientes han comprado el producto 6?
SELECT nombre FROM cliente 
WHERE id_cliente IN (SELECT id_cliente from FACTURA f INNER JOIN PRODUCTO_FACTURA p ON f.id_factura = p.id_factura
WHERE p.id_producto = 6);

---SELECT id_cliente from FACTURA f INNER JOIN PRODUCTO_FACTURA p ON f.id_factura = p.id_factura
---WHERE p.id_producto = 6;
COMMIT;