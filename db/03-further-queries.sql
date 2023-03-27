\c nc_flix

\echo '\n The number of films in stock for each genre:'

SELECT genres.genre_slug, COUNT(genres.genre_id) AS films_in_stock FROM stock
JOIN genres_movies 
ON stock.movie_id = genres_movies.movie_id 
JOIN genres ON genres_movies.genre_id = genres.genre_id
GROUP BY genres.genre_id;


\echo '\n Here is the average rating for films in stock in Newcastle:'

WITH newcastle_in_stock_ratings AS (
    SELECT movies.movie_id, movies.title, movies.rating FROM stock JOIN stores ON stock.store_id = stores.store_id
    JOIN movies ON stock.movie_id = movies.movie_id
    WHERE city = 'Newcastle'
    GROUP BY movies.movie_id
)
SELECT ROUND(AVG(rating), 2) AS average_rating
FROM newcastle_in_stock_ratings;


\echo '\n Here are all the films made in 90s with above average rating available in Leeds'

SELECT title, rating FROM movies WHERE release_date BETWEEN '1990-01-01' AND '1999-12-31'
AND rating > (SELECT ROUND(AVG(rating), 2) FROM movies);

-- WITH ninety_films AS (
--     SELECT title, rating FROM movies WHERE release_date BETWEEN '1990-01-01' AND '1999-12-31'
-- )
-- SELECT title, rating
-- FROM ninety_films
-- WHERE rating > (SELECT ROUND(AVG(rating), 2) FROM movies);


\echo '\n Here is the number of copies of the top rated film of the 5 most recently released films we have in stock across all stores:'

SELECT movies.title, COUNT(stock_id) AS stock_count FROM stock 
JOIN movies ON movies.movie_id = stock.movie_id
WHERE movies.movie_id IN (
    WITH latest_movies AS (
    SELECT movie_id, title, release_date, COALESCE(rating, 0) AS rating
    FROM movies ORDER BY release_date DESC LIMIT 5
    )
    SELECT movie_id FROM latest_movies ORDER BY rating DESC LIMIT 1
)
GROUP BY movies.movie_id;


\echo '\n These are the locations where our customers live which dont have stores:'

SELECT location AS locations_with_no_stores FROM customers
EXCEPT 
SELECT city FROM stores;


\echo '\nThese are the locations we have influence over:'

SELECT location AS locations_with_stores_and_customers FROM customers
UNION 
SELECT city FROM stores;


\echo '\n This store has the highest quantity of stock:'

SELECT stock.store_id, stores.city, COUNT(stock.stock_id) AS stock_count FROM stock 
JOIN stores ON stock.store_id = stores.store_id
WHERE stores.city IN
(SELECT location AS stores_with_customers FROM customers
INTERSECT 
SELECT city FROM stores)
GROUP BY stock.store_id, stores.city
ORDER BY stock_count DESC LIMIT 1;


\echo '\n ...and this is the most abundant genre in that store:'
SELECT genres.genre_slug, COUNT(genres.genre_slug) AS most_abundant_genre_count FROM stock
JOIN genres_movies 
ON stock.movie_id = genres_movies.movie_id 
JOIN genres ON genres_movies.genre_id = genres.genre_id
WHERE stock.store_id IN
    (
    SELECT stock.store_id FROM stock 
    JOIN stores ON stock.store_id = stores.store_id
    WHERE stores.city IN
        (
        SELECT location AS stores_with_customers FROM customers
        INTERSECT 
        SELECT city FROM stores
        )  
    GROUP BY stock.store_id 
    ORDER BY store_id DESC LIMIT 1
    )
GROUP BY genres.genre_slug
ORDER BY most_abundant_genre_count ASC LIMIT 1;
