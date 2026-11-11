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
