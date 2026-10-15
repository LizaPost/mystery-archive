PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS movie_ratings;
DROP TABLE IF EXISTS book_ratings;
DROP TABLE IF EXISTS books_culprits;
DROP TABLE IF EXISTS books_movies;
DROP TABLE IF EXISTS movie_characters;
DROP TABLE IF EXISTS book_characters;
DROP TABLE IF EXISTS culprits;
DROP TABLE IF EXISTS characters;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS books;

CREATE TABLE books (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL UNIQUE,
    first_published INTEGER NOT NULL,
    type TEXT NOT NULL CHECK (type IN ('Novel', 'Short Story'))
);

CREATE TABLE movies (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    season_number INTEGER NOT NULL CHECK (season_number > 0),
    episode_number INTEGER NOT NULL CHECK (episode_number > 0),
    first_aired TEXT NOT NULL
);

CREATE TABLE characters (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE culprits (
    id INTEGER PRIMARY KEY,
    culprit TEXT NOT NULL UNIQUE
);

CREATE TABLE book_characters (
    book_id INTEGER NOT NULL,
    character_id INTEGER NOT NULL,
    PRIMARY KEY (book_id, character_id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (character_id) REFERENCES characters(id)
);

CREATE TABLE movie_characters (
    movie_id INTEGER NOT NULL,
    character_id INTEGER NOT NULL,
    PRIMARY KEY (movie_id, character_id),
    FOREIGN KEY (movie_id) REFERENCES movies(id),
    FOREIGN KEY (character_id) REFERENCES characters(id)
);

CREATE TABLE books_movies (
    book_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    PRIMARY KEY (book_id, movie_id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

CREATE TABLE books_culprits (
    book_id INTEGER NOT NULL,
    culprit_id INTEGER NOT NULL,
    PRIMARY KEY (book_id, culprit_id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (culprit_id) REFERENCES culprits(id)
);

CREATE TABLE book_ratings (
    book_id INTEGER PRIMARY KEY,
    rating REAL NOT NULL CHECK (rating >= 0 AND rating <= 5),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

CREATE TABLE movie_ratings (
    movie_id INTEGER PRIMARY KEY,
    rating REAL NOT NULL CHECK (rating >= 0 AND rating <= 10),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);