\c nc_flix

\echo '\n Here are all the movie titles which were released in the 21st century:'

SELECT title FROM movies WHERE release_date > '2000-01-01';

\echo '\n This is our oldest customer:'

SELECT customer_name FROM customers ORDER BY date_of_birth LIMIT 1;

\echo '\n Customers beginning with D (youngest to oldest):'

SELECT customer_name FROM customers 
WHERE customer_name LIKE 'D%'
ORDER BY date_of_birth DESC;

\echo '\n This is the average rating of the all the movies made in the 80s:'

SELECT AVG(COALESCE(rating, 0))
FROM movies 
WHERE release_date BETWEEN '1980-01-01' AND '1990-12-31';

\echo '\n After decreasing the price of the movie rentals, the movie table now looks like:'

UPDATE movies 
SET 
    cost = ROUND(cost * 0.95, 2)
RETURNING *;


