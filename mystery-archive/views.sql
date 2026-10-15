DROP VIEW IF EXISTS book_adaptations;
DROP VIEW IF EXISTS books_without_adaptation;
DROP VIEW IF EXISTS poirot_episode_guide;
DROP VIEW IF EXISTS marple_episode_guide;
DROP VIEW IF EXISTS adaptations_with_poirot_helpers;

-- this view shows every book that has an adaptation
CREATE VIEW book_adaptations AS
SELECT
    books.id AS book_id,
    books.title AS book_title,
    movies.id AS movie_id,
    movies.title AS adaptation_title,
    movies.season_number,
    movies.episode_number
FROM books
JOIN books_movies ON books.id = books_movies.book_id
JOIN movies ON books_movies.movie_id = movies.id;

-- this view shows books without adaptation
CREATE VIEW books_without_adaptation AS
SELECT
    books.id,
    books.title,
    books.first_published,
    books.type
FROM books
LEFT JOIN books_movies ON books.id = books_movies.book_id
WHERE books_movies.movie_id IS NULL;

-- these views show which season and episode number corresponds title
-- streaming-friendly episode guide

-- poirot guide
CREATE VIEW poirot_episode_guide AS
SELECT
    movies.season_number,
    movies.episode_number,
    movies.title AS adaption_title,
    movies.first_aired
FROM movies
JOIN movie_characters ON movies.id = movie_characters.movie_id
WHERE movie_characters.character_id = 1
ORDER BY
    movies.season_number,
    movies.episode_number;

-- miss marple guide
CREATE VIEW marple_episode_guide AS
SELECT
    movies.season_number,
    movies.episode_number,
    movies.title AS adaptation_title,
    movies.first_aired
FROM movies
         JOIN movie_characters ON movies.id = movie_characters.movie_id
WHERE movie_characters.character_id = 7
ORDER BY
    movies.season_number,
    movies.episode_number;

-- this view show episodes with Poirot helpers (Hastings, Japp, and/or Miss Lemon)
CREATE VIEW adaptations_with_poirot_helpers AS
SELECT
    movies.season_number,
    movies.episode_number,
    movies.title AS adaptation_title,
    GROUP_CONCAT(characters.name, ', ') AS characters
FROM movies
JOIN movie_characters ON movies.id = movie_characters.movie_id
JOIN characters ON movie_characters.character_id = characters.id
WHERE characters.name IN ('Captain Hastings', 'Inspector Japp', 'Miss Lemon')
GROUP BY
    movies.id,
    movies.season_number,
    movies.episode_number,
    movies.title
ORDER BY
    movies.season_number,
    movies.episode_number;
