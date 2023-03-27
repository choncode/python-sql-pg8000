# Python-SQL-pg8000

## Project Summary

To test `SQL` knowledge and to utilise `pg8000` to incorporate the `SQL` code with `Python`.

<br>

## Section One

### Part One

`01-query-films.sql`

Query the database:

1. To retrieve all of the movie titles that were released in the 21st century.

2. Find the oldest customer.

3. Find the customers who's name begin with the letter _D_. Organise the results by age, youngest to oldest.

4. Find the average rating of the movies released in the 1980s. If there are any `null` ratings, they are treated as a 0 rating.

5. The rise in living costs is affecting rentals, drop the cost of all rentals by 5% and display the updated table. **As this is a monetary value make sure it is rounded to 2 decimal places

<br>

### Part Two

`02-genres-tables.sql`

1. Create a `genres` table.

2. Create a many to many relationship between the `genres` table and the `movies` using a junction table.

3. Insert some data about the film genres. Example:


| Film                               | Genres               |
| ---------------------------------- | -------------------- |
| Ghostbusters II                    | Family, Comedy       |
| The Breakfast Club                 | Comedy, Drama        |
| Todo Sobre Mi Madre                | Comedy, Drama       


<br>

### Part Three

`03-further-queries.sql`

Query the database:

1. Query the database to find the number of films in stock for each genre.

2. Query the database to find the average rating for films in stock in Newcastle.

3. Query the database to retrieve all the films released in the 90s which have a rating greater than the total average.

4. Query the database to find the amount of films in stock, across **all** stores, of the top rated film of the five most recently released films.

5. Query the database to find a list of all the locations customers live in which **don't** contain a store.

6. Query the database to find a list of all the locations we have influence over (locations of stores and/or customers), **there should be no repeated data**.

7. Of the stores which exist in locations that have customers, calculate which store has the largest catalogue of stock. What is the most abundant genre in that store?

<br>

## Section Two

Using the `pg8000` library to integrate SQL querying skills with Python. Each function should be built feature by feature using TDD. The locally hosted database is the test database. Any other helper functions should be tested individually.

1. Create the function `select_movies`. It should return a list of movie dictionaries. From your locally hosted movies table.
   Each movie should contain the following keys:

-   movie_id
-   title
-   release_date
-   rating
-   classification

The default order of the movies should be alphabetically by title.

2. It should have an optional `sort_by` argument which allows it to be sorted by:

-   release_date
-   rating
-   cost

3. It should accept an optional `order` argument which allows the sort order to be flipped.

4. It should accept an optional `min_rating` argument which filters the list of movies to only contains movies with ratings greater than the passed value.

<br>

### Bash Script

The bash script `run-all.sh` runs all `*.sql` files in the `./db` folder and will save the output of each file in the `./db` directory to a `\*.txt` file of the same name. To run this script, run the below in your terminal.

```python
./run-all.sh
```
