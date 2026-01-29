-- Where our code will go

-- Creates a keyspace(creating a database)
CREATE KEYSPACE IF NOT EXISTS albumDB WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor' : 1};

-- Create a table

CREATE TABLE IF NOT EXISTS albumDB.albums (
    album_id text PRIMARY KEY,
    album_name text,
    artist text,
    sales INT,
    decade INT,
    country text,
    genre text
);

