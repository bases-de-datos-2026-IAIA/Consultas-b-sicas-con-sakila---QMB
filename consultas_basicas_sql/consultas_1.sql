-- TAREA CONSULTAS QUERÉN
USE sakila;

-- 1. Muestra todos los datos de los primeros 10 actores registrados, ordenados por su identificador de forma
-- ascendente.

SELECT * FROM actor ORDER BY actor_id ASC LIMIT 10 ;

-- 2. Muestra el identificador, título, año de lanzamiento y precio de renta de las películas cuyo precio sea mayor que
-- 3.00. Ordena los resultados del precio más alto al más bajo.

SELECT film_id,title,release_year,rental_rate FROM film WHERE rental_rate > 3.00 ORDER BY rental_rate DESC;

-- 3. Muestra el identificador, nombre, apellido y correo electrónico de los clientes activos. Ordena los resultados
-- alfabéticamente por apellido y muestra únicamente los primeros 15.
SELECT customer_id, first_name,last_name,email FROM customer  WHERE active = 1 ORDER BY last_name ASC LIMIT 15 

-- 4.Muestra el identificador del pago, identificador del cliente, monto y fecha de los pagos cuyo monto sea menor o
-- igual a 2.99. Ordena los resultados por monto ascendente y después por identificador del pago.
SELECT payment_id, customer_id, amount, payment_date FROM payment WHERE amount <= 2.99 ORDER BY amount, payment_id ASC;

-- 5. Muestra todos los datos de las ciudades que pertenezcan al país con identificador 44. Ordena los resultados
-- alfabéticamente por nombre de la ciudad.
SELECT city, country_id FROM city WHERE country_id = 44 ORDER BY city ASC;

-- 6. Muestra el identificador y nombre de los idiomas cuyo identificador sea diferente de 1. Ordena los resultados
-- por identificador.
SELECT language_id,name FROM language WHERE language_id != 1 ORDER BY language_id DESC;

-- 7. Muestra el identificador, título, duración y clasificación de las películas que duren entre 90 y 120 minutos,
-- incluyendo ambos límites. Ordena los resultados por duración ascendente. Sin BETWEEN.
SELECT film_id,title,length,rating FROM film WHERE length BETWEEN 90 and 120 ORDER BY length ASC LIMIT 10 OFFSET 5 ;

-- 8. Muestra el título, precio de renta y clasificación de las películas cuyo precio de renta no esté entre 2.00 y 4.00.
-- Ordena los resultados por precio descendente y muestra únicamente los primeros 20. Con BETWEEN.
SELECT title,rental_rate,rating FROM film WHERE rental_rate NOT BETWEEN 2.00 and 4.00 ORDER BY rental_rate DESC LIMIT 20;

-- 9. Muestra todos los datos de las categorías cuyos identificadores sean 1, 3, 5 o 7. Sin IN.
SELECT * FROM category WHERE category_id = 1 or category_id = 3  or category_id = 5 or category_id = 7;

-- 10. Muestra el título, clasificación y precio de renta de las películas clasificadas como G, PG o PG-13. Ordena los
-- resultados alfabéticamente por título y muestra únicamente las primeras 15. Con IN.
SELECT title,rating,rental_rate FROM film WHERE rating IN ('G','PG','PG-13') ORDER BY title ASC LIMIT 15;

-- 11. Muestra el identificador del inventario, identificador de la película e identificador de la tienda de las copias
-- que no pertenezcan a la tienda 1. Ordena los resultados por identificador del inventario y muestra únicamente
-- los primeros 15. Con IN.

SELECT inventory_id, film_id, store_id FROM inventory WHERE store_id in ('1') ORDER BY inventory_id ASC LIMIT 15;

-- 12. Muestra el identificador del pago, identificador del cliente y monto de los pagos cuyo monto no sea ninguno de
-- los siguientes valores: 0.99, 2.99 o 4.99. Ordena los resultados por monto descendente y muestra únicamente
-- los primeros 10. Sin IN.
SELECT payment_id, customer_id, amount FROM payment WHERE amount != 0.99 and amount != 2.99 and amount != 4.99 ORDER BY amount DESC LIMIT 10;

-- 13. Muestra el identificador, nombre y apellido de los actores cuyo nombre comience con la letra J. Ordena los
-- resultados alfabéticamente por apellido.
SELECT actor_id, first_name, last_name FROM actor WHERE first_name LIKE 'J%' ORDER BY last_name ASC;

-- 14. Muestra el identificador, nombre, apellido y correo electrónico de los clientes cuyo apellido termine con la
-- letra S. Ordena los resultados por apellido y después por nombre.

SELECT customer_id, last_name, first_name, email FROM customer WHERE last_name LIKE '%S';

-- 15. Muestra el identificador, título y descripción de las películas cuyo título contenga la palabra LOVE. Ordena los
-- resultados alfabéticamente por título.
SELECT film_id, title, description FROM film WHERE title LIKE '%love%'ORDER BY title ASC;

-- 16. Muestra el identificador de la dirección, dirección, distrito y código postal de los domicilios cuyo distrito sea
-- California o cuyo código postal comience con el número 9. Ordena por identificador de la dirección y muestra
-- los primeros 15 registros.

SELECT address_id, address, district, postal_code FROM address WHERE district = 'California' or postal_code LIKE '9%' ORDER BY address_id ASC LIMIT 15;

-- 17. Muestra el identificador y nombre de los países cuyo nombre comience con la letra A o con la letra B y cuyo
-- identificador sea mayor que 20. Ordena los resultados alfabéticamente por país.

SELECT country_id, country FROM country WHERE (country LIKE 'A%' or country LIKE 'B%') and country_id > 20 ORDER BY country ASC;

-- 18. Muestra el identificador, título, duración, clasificación y precio de renta de las películas que duren más de 100
-- minutos, estén clasificadas como PG-13 y tengan un precio de renta menor o igual a 2.99. Ordena por duración
-- descendente y muestra los primeros 10 resultados.

SELECT film_id, title, length, rating, rental_rate FROM film WHERE (length > 100) and (rating = 'PG-13') and (rental_rate <= 2.99) ORDER BY length DESC LIMIT 10;

-- 19. Muestra el identificador, título y descripción de las películas cuya descripción contenga la palabra Drama,
-- pero cuyo título no comience con la letra A. Ordena alfabéticamente por título y muestra únicamente las
-- primeras 10.

SELECT film_id, title, description FROM film WHERE (description LIKE '%Drama%') and (title NOT LIKE 'A%') ORDER BY title ASC LIMIT 10;

-- 20. Muestra el identificador, nombre, apellido, correo electrónico e identificador de la tienda de los empleados
-- activos que pertenezcan a la tienda 1 o a la tienda 2. Ordena por identificador del empleado.
SELECT staff_id, first_name, last_name, email, store_id FROM staff WHERE (active = 1) AND (store_id = 1 or store_id = 2) ORDER BY staff_id ASC;


-- 21. Muestra el identificador de la renta, identificador del cliente, fecha de renta y fecha de devolución de las
-- rentas realizadas desde el 24 hasta el 26 de mayo de 2005, incluyendo los tres días completos. Ordena por
-- fecha de renta ascendente y muestra los primeros 15 registros.
SELECT rental_id, customer_id, rental_date, return_date FROM rental WHERE (rental_date >= '2005-05-24'  and rental_date < '2005-05-27') ORDER BY rental_date ASC LIMIT 15;

-- 22. Muestra el identificador del pago, identificador del cliente, monto y fecha de pago de los pagos mayores que
-- 5.00, realizados por clientes cuyos identificadores estén entre 1 y 100. Ordena los resultados por monto
-- descendente.

SELECT payment_id, customer_id, amount, payment_date FROM payment
WHERE amount > 5.00 AND customer_id BETWEEN 1 AND 100 ORDER BY amount DESC;

-- 23. Muestra todos los datos de los registros que relacionan películas con actores, pero únicamente cuando el
-- identificador del actor sea 1, 2 o 3. Ordena primero por identificador del actor y después por identificador de la
-- película.

SELECT * FROM film_actor WHERE actor_id IN (1, 2, 3)
ORDER BY actor_id ASC, film_id ASC;

-- 24. Muestra el identificador de la película, identificador de la categoría y fecha de última actualización de los
-- registros que relacionan películas con categorías, excluyendo las categorías con identificadores 1, 2 y 3.
-- Ordena por identificador de la película y muestra los primeros 20 resultados.
SELECT film_id, category_id, last_update FROM film_category WHERE category_id NOT IN (1, 2, 3) ORDER BY film_id ASC LIMIT 20;

-- 25. Muestra todos los datos de las tiendas cuyo identificador sea igual a 1 o cuyo encargado tenga el identificador 2
--  Ordena los resultados por identificador de la tienda.
SELECT * FROM store WHERE store_id = 1 OR manager_staff_id = 2 ORDER BY store_id ASC;

-- 26. Muestra el identificador de la renta, identificador del cliente, fecha de renta y fecha de devolución de las
-- películas que ya tengan registrada su fecha de devolución y que pertenezcan a clientes con identificador
-- menor que 50. Ordena por fecha de renta descendente y muestra los primeros 10 resultados.

SELECT rental_id, customer_id, rental_date, return_date FROM rental WHERE return_date IS NOT NULL AND customer_id < 50
ORDER BY rental_date DESC LIMIT 10;



