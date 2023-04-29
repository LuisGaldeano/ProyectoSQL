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

-- Crea una nueva columna en actors y agrega nombres y apellidos para hacer el join por ahí.
ALTER TABLE actors ADD COLUMN name_surname VARCHAR(255);
UPDATE actors SET name_surname = CONCAT_WS(' ', first_name, last_name) WHERE actor_id > 0;

-- Crea una nueva columna en old_hdd y agrega nombres y apellidos para hacer el join por ahí.
ALTER TABLE old_hdd ADD COLUMN name_surname VARCHAR(255);
UPDATE old_hdd SET name_surname = CONCAT_WS(' ', first_name, last_name) WHERE Old_hdd_id > 0;

-- Uno las tablas mediante un left join para poder tener en ambas el actors_id y film_id
CREATE TABLE New_HDD
SELECT *
FROM	
     (SELECT 
		 Old_HDD_id AS old_HDD,
		 film_id AS film,
		 actor_id AS actor,
		 Categories_category_id AS category
	FROM old_hdd
		 LEFT JOIN actors ON actors.name_surname = old_hdd.name_surname 
		 LEFT JOIN film ON	film.title = old_hdd.title)
	AS old_HDD_table;
    
-- Creada la tabla new_HDD que contiene los ids necesarios para realizar las FK, realizo los enlaces.
ALTER TABLE new_hdd ADD CONSTRAINT fk_film_id FOREIGN KEY (film) REFERENCES film(film_id);
ALTER TABLE new_hdd ADD CONSTRAINT fk_actor_id FOREIGN KEY (actor) REFERENCES actors(actor_id);
ALTER TABLE new_hdd ADD CONSTRAINT fk_category_id FOREIGN KEY (category) REFERENCES categories(category_id);
ALTER TABLE film ADD CONSTRAINT fk_language_id FOREIGN KEY (language) REFERENCES language(language_id);
ALTER TABLE rental ADD CONSTRAINT fk_staff_id FOREIGN KEY (staff_id) REFERENCES staff(staff_id);  