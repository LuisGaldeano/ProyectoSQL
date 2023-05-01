-- Selects para revisar las columnas
SELECT * FROM film;
SELECT * FROM new_hdd;
SELECT * FROM old_hdd;
SELECT * FROM actors;
SELECT * FROM categories;
SELECT * FROM language;
SELECT * FROM rental;
SELECT * FROM staff;
SELECT * FROM inventary;

-- Pregunta 1 y 2 - ¿Cuales son los actores con más películas?
SELECT 
	actor,
    first_name AS actor_name,
    last_name AS actor_surname,
	COUNT(film) AS films_by_actor
FROM
	new_hdd
    LEFT JOIN actors ON actors.actor_id = new_hdd.actor
GROUP BY actor
ORDER BY films_by_actor DESC;
	
-- Pregunta 3 y 4 - ¿Cual es la categoría con más películas?
SELECT 
	category,
    categories.name AS category_name,
    COUNT(film) AS films_by_category
FROM
	new_hdd
    LEFT JOIN categories ON categories.category_id = new_hdd.category
GROUP BY category
ORDER BY films_by_category DESC;

-- Pregunta 5 y 6 - ¿Cual es la categoría con más películas?
SELECT 
	film.title,
    COUNT(actor) AS actors_by_film
FROM
	new_hdd
    LEFT JOIN film ON film.film_id = new_hdd.film
GROUP BY film
ORDER BY actors_by_film DESC;

-- Pregunta 7 y 8 - ¿Cual es la película más corta del repertorio?
SELECT 
	film.title,
    film.length AS length
FROM
	film
ORDER BY length DESC;

-- Pregunta 9 y 10 - ¿Cual fue la película que más veces se ha alquilado?
SELECT 
	film.title,
    film.rental_duration AS ren_duration
FROM
	film
ORDER BY ren_duration DESC;

-- Pregunta Bonus - ¿Cuantos actores trabajan juntos en más de una película?
SELECT 
    film.title,
	COUNT(DISTINCT new_hdd.actor) AS actors_by_film
FROM
	new_hdd
    LEFT JOIN actors ON actors.actor_id = new_hdd.actor
    LEFT JOIN film ON new_hdd.film = film.film_id
GROUP BY film.title
ORDER BY actors_by_film DESC;