from src.select_movies import select_movie
from decimal import Decimal
from datetime import date

def test_returns_a_list_from_sql():
    result = select_movie()
    print(f'result is {result}')
    assert isinstance(result, list)

def test_returns_all_properties():
    result = select_movie()
    for movie in result:
        assert 'movie_id' in movie
        assert 'title' in movie
        assert 'release_date' in movie
        assert 'rating' in movie
        assert 'cost' in movie
        assert 'classification' in movie

def test_returns_movies_in_alphabetical_order_by_default():
    result = select_movie()
    assert result[0]['title'] == 'A Fish Called Wanda'
    assert result[24]['title'] == 'Tron'

def test_returns_movies_ordered_by_argument_rating():
    result = select_movie('rating')
    assert result[0]['rating'] == 1

def test_returns_movies_ordered_by_argument_cost():
    result = select_movie('cost')
    assert result[0]['cost'] == Decimal('0.95')

def test_returns_movies_ordered_by_argument_release_date():
    result = select_movie('release_date')
    assert result[0]['release_date'] == date(1963, 7, 31) 
    assert result[24]['release_date'] == date(2019, 12, 20)

def test_returns_movies_ordered_by_argument_and_sorted():
    result = select_movie('release_date', 'DESC')
    assert result[0]['release_date'] == date(2019, 12, 20)
    assert result[24]['release_date'] == date(1963, 7, 31) 

def test_returns_movies_with_order_argument():
    result = select_movie('release_date', 'DESC', 5)
    assert result[0]['rating'] == 5



