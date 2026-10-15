-- Indexes columns that are frequently used for joins and views.

DROP INDEX IF EXISTS index_movie_character_id;
DROP INDEX IF EXISTS index_book_character_id;
DROP INDEX IF EXISTS index_book_movie_id;
DROP INDEX IF EXISTS index_books_culprit_id;

-- index for reverse searching in movies (by character_id)
CREATE INDEX index_movie_character_id ON movie_characters(character_id);

-- index for reverse searching in books (by character_id)
CREATE INDEX index_book_character_id ON book_characters(character_id);

-- index for reverse searching in books_movies (by movie_id)
CREATE INDEX index_book_movie_id ON books_movies(movie_id);

-- index for reverse searching in books_culprits (by culprit_id)
CREATE INDEX index_books_culprit_id ON books_culprits(culprit_id);

