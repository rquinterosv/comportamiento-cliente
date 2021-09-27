Ejercicio 1:

-- En la terminal (no en el postgres) se tiene que ingresar:
-- psql -U rafael comportamiento_cliente < unidad2.sql;


Ejercicio 2:

a)Primero vamos a revisar si esta el registro del usuario01

SELECT id FROM cliente WHERE nombre = 'usuario01';

b)después vamos a buscar si ha realizado las compras


SELECT id, fecha FROM compra WHERE cliente_id = 1;

 id |   fecha    
----+------------
 26 | 2020-01-31
 31 | 2020-03-29

SELECT * FROM producto WHERE descripcion = 'producto9';

 id | descripcion | stock | precio 
----+-------------+-------+--------
  9 | producto9   |     4 |   4219

SELECT * FROM detalle_compra WHERE id = '1';

 id | producto_id | compra_id | cantidad 
----+-------------+-----------+----------
  1 |           2 |         2 |        9
(1 row)

Ejercicio 3:

El primer paso es ver el stock de los productos:

SELECT * FROM producto WHERE id in (1,2,8);

 id | descripcion | stock | precio 
----+-------------+-------+--------
  1 | producto1   |     6 |   9107
  2 | producto2   |     5 |   1760
  8 | producto8   |     0 |   8923
(3 rows)
El producto 8 se queda sin stock.

Ejercicio 4:
Para desactivar AUTOCOMMIT

a) \set AUTOCOMMIT off

b) Para insertar un nuevo cliente utilizaremos:

INSERT INTO cliente (nombre, email) VALUES ('amelia', 'gatitos@123.cl');

c) Comprobación del nuevo cliente: 

SELECT * FROM cliente WHERE nombre='amelia';
 id | nombre |     email      
----+--------+----------------
 13 | amelia | gatitos@123.cl
(1 row)

d) ROLLBACK; 
(Para hacer un ROLLBACK la mejor opción es ir dejando puntos de guardado (savepoint) para regresar donde se desea)

e) Verificación de la restauración:

SELECT * FROM cliente WHERE nombre='amelia';
 id | nombre | email 
----+--------+-------
(0 rows)

f) Activación AUTOCMMIT:

\set AUTOCOMMIT off 