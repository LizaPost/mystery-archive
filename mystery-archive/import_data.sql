-- Populates the database tables with data.
-- Run setup.sql before running this file.

.mode csv

.import --csv --skip 1 data/books.csv books
.import --csv --skip 1 data/movies.csv movies
.import --csv --skip 1 data/characters.csv characters
.import --csv --skip 1 data/culprits.csv culprits

.import --csv --skip 1 data/book_characters.csv book_characters
.import --csv --skip 1 data/movie_characters.csv movie_characters
.import --csv --skip 1 data/books_movies.csv books_movies
.import --csv --skip 1 data/books_culprits.csv books_culprits

.import --csv --skip 1 data/book_ratings.csv book_ratings
.import --csv --skip 1 data/movie_ratings.csv movie_ratings

