\c nc_flix

CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre_slug VARCHAR NOT NULL,
    genre_description VARCHAR NOT NULL);

INSERT INTO genres (genre_slug, genre_description)
VALUES 
('family',	'Fun for everyone!'),
('comedy',	'A giggle a minute'),
('romance',	'I feel it in my fingers, I feel it in my toes'),
('fantasy',	'There be elves and witches'),
('action',	'Shooty shooty, punchy punchy'),
('drama',	'Plot driven story time'),
('crime',	'Watch out, there''s gangsters about'),
('sci_fi',	'Your scientists were so preoccupied with whether they could...');

CREATE TABLE genres_movies (
    genres_movies_id SERIAL PRIMARY KEY,
    movie_id INT REFERENCES movies(movie_id),
    genre_id INT REFERENCES genres(genre_id)
);

INSERT INTO genres_movies (movie_id, genre_id) VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (2, 6),
    (3, 2),
    (3, 6),
    (4, 1),
    (5, 1),
    (6, 1),
    (7, 4),
    (7, 5),
    (8, 3),
    (8, 6),
    (9, 2),
    (9, 6),
    (9, 7),
    (10, 6),
    (10, 7),
    (11, 2),
    (11, 3);    

SELECT movies.title, STRING_AGG(genres.genre_slug, ', ') AS genres FROM movies
JOIN genres_movies ON movies.movie_id = genres_movies.movie_id
JOIN genres ON genres.genre_id = genres_movies.genre_id
GROUP BY movies.movie_id

