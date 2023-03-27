\c nc_flix


\echo '\n The store with the highest total of sequels is:'
SELECT store_id, COUNT(stock_id) AS sequel_count FROM movies
JOIN stock ON stock.movie_id = movies.movie_id
WHERE movies.title ~ 'I[A-Z]'
GROUP BY store_id
ORDER BY sequel_count DESC LIMIT 1;