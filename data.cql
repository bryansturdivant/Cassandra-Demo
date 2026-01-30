-- actual database
-- Link to the dataset: https://www.kaggle.com/datasets/adilshamim8/world-cities-countries-and-languages-dataset

CREATE KEYSPACE IF NOT EXISTS cityDB WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor' : 1};

-- Create a table

CREATE TABLE IF NOT EXISTS cityDB.cities (
    id INT PRIMARY KEY,
    name text,
    countrycode text,
    district text, 
    population int
);

-- Insert 

INSERT INTO cityDB.cities
(id, name, countrycode, district, population)
VALUES(1, 'Kabul', 'AFG', 'Kabol', 1780000);

INSERT INTO cityDB.cities
(id, name, countrycode, district, population)
VALUES(2, 'Quandahar', 'AFG', 'Qandahar', 237500);

INSERT INTO cityDB.cities
(id, name, countrycode, district, population)
VALUES(3, 'Herat', 'AFG', 'Herat', 186800);

INSERT INTO cityDB.cities
(id, name, countrycode, district, population)
VALUES(4, 'Mazar-e-Sharif', 'AFG', 'Balkh', 127800);

INSERT INTO cityDB.cities
(id, name, countrycode, district, population)
VALUES(5, 'Amsterdam', 'Nld', 'Noord-Holland', 731200);