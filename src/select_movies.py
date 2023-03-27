import pg8000.native as pg

def select_movie(order_by = 'title', order = 'ASC', min_rating = 0):
    con = pg.Connection("chonlee", database='nc_flix')
    query = f'SELECT * FROM movies ORDER BY {order_by}'
    result = con.run(query)
    column_names = [data['name'] for data in con.columns]

    movie_list = []
    for movie in result:
        movie_list.append({
            column_names[0]: movie[0],
            column_names[1]: movie[1],
            column_names[2]: movie[2],
            column_names[3]: movie[3],
            column_names[4]: movie[4],
            column_names[5]: movie[5]
        })

    print(movie_list)

    return movie_list



# -   movie_id
# -   title
# -   release_date
# -   rating
# -   classification



