-- Where our code will go
-- Using kaggle data from: https://www.kaggle.com/datasets/ciroduro01/best-selling-albums-of-all-time
-- Creates a keyspace(creating a database)
CREATE KEYSPACE IF NOT EXISTS albumDB WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor' : 1};

-- Create a table

CREATE TABLE IF NOT EXISTS albumDB.albums (
    album_id text PRIMARY KEY,
    album_name text,
    artist text,
    year INT,
    sales_millions INT,
    decade INT,
    country text,
    genre text
);

-- insert data into that table

INSERT INTO albumDB.albums
(album_id, album_name, artist, year, sales_millions, decade, country, genre)
VALUES('album1', 'Thriller', 'Michael Jackson', 1982, 70, 1980, 'USA', 'Pop');

INSERT INTO albumDB.albums
(album_id, album_name, artist, year, sales_millions, decade, country, genre)
VALUES('album2', 'Back in Black', 'AC/DC', 1980, 50, 1980, 'Australia', 'Rock');

INSERT INTO albumDB.albums
(album_id, album_name, artist, year, sales_millions, decade, country, genre)
VALUES('album3', 'The Dark Side of the Moon', 'Pink Floyd', 1973, 45, 1970, 'UK', 'Rock');

INSERT INTO albumDB.albums
(album_id, album_name, artist, year, sales_millions, decade, country, genre)
VALUES('album4', 'The Bodyguard', 'Whitney Houston', 1992, 45, 1990, 'USA', 'Pop');

INSERT INTO albumDB.albums
(album_id, album_name, artist, year, sales_millions, decade, country, genre)
VALUES('album5', 'Bat Out of Hell', 'Meat Loaf', 1977, 43, 1970, 'USA', 'Rock');



