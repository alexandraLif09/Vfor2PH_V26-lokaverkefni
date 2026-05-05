DROP TABLE IF EXISTS people CASCADE;
DROP TABLE IF EXISTS characters CASCADE;
DROP TABLE IF EXISTS homes CASCADE;
DROP TABLE IF EXISTS places CASCADE;
DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    passwords VARCHAR(255),
    createdAt TIMESTAMP,
    lastLogin TIMESTAMP
);

CREATE TABLE IF NOT EXISTS places (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS homes (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    placeID INT NOT NULL, 

    CONSTRAINT fk_place
        FOREIGN KEY(placeID)
        REFERENCES places(id)
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS characters (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    homeID INT NOT NULL,

    CONSTRAINT fk_home
        FOREIGN KEY(homeID)
        REFERENCES homes(id)
        ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS people (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    alive BOOLEAN NOT NULL,
    placeID INT NOT NULL,
    characterID INT NOT NULL,
    image_url VARCHAR(500),

    CONSTRAINT fk_place
        FOREIGN KEY(placeID)
        REFERENCES places(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_character
        FOREIGN KEY(characterID)
        REFERENCES characters(id)
        ON DELETE RESTRICT
);

TRUNCATE TABLE people, characters, homes, places, users RESTART IDENTITY CASCADE;

INSERT INTO places (name) 
VALUES ('Storybrooke'), ('Enchanted Forest'), 
    ('Neverland'), ('Wonderland'), 
    ('Oz'), ('Underworld');

INSERT INTO homes (name, placeID)
VALUES ('Swan house', 1), ('The Mills House', 1), 
    ('Evil Queens Palace', 2), ('The Jolly Roger', 2),
    ('the Royal Castle', 2), ('The Dark Castle', 2), 
    ('Tulip Pod Chamber', 2), ('A cottage', 2), ('The Forest', 2),
    ('A cottage', 5), ('Neverland camp', 4);

INSERT INTO characters (name, homeID)
VALUES ('The Savior', 1), ('Truest beliver', 2), ('Evil Queen', 3),
    ('Captain Hook', 4), ('Snow White', 5), ('Prince Charming', 5),
    ('Rumplestiltskin', 6), ('Belle', 6), ('Blue Fairy', 7),
    ('Mad Hatter', 8), ('The Huntsman', 9), ('Wicked Witch of the West', 10),
    ('Jiminy Cricket', 9), ('Robin Hood', 9), ('Baelfire', 8), 
    ('Red Riding Hood', 8), ('Granny', 8), ('Peter Pan', 11),
    ('Felix', 11);

INSERT INTO people (name, alive, placeID, characterID, image_url)
VALUES ('Emma Swan', TRUE, 1, 1, '/images/Emma.webp'), 
    ('Henry Mills', TRUE, 1, 2, '/images/Henry.webp'),
    ('Regina Mills', TRUE, 1, 3, '/images/regina.jpg'),
    ('Killian Jones', TRUE, 2, 4, '/images/Killian.webp'),
    ('Mary Margaret', TRUE, 1, 5, '/images/Mary.webp'), 
    ('David Nolan', TRUE, 1, 6, '/images/David.webp'),
    ('Mr. Gold', FALSE, 1, 7, '/images/Gold.webp'),
    ('Belle', FALSE, 1, 8, '/images/Belle.webp'),
    ('Reul Ghorm', TRUE, 1, 9, '/images/Reul.webp'),
    ('Jefferson', TRUE, 1, 10, '/images/Jefferson.webp'),
    ('Sheriff graham Humbert', FALSE, 1, 11, '/images/Graham.webp'),
    ('Zelena Mills', TRUE, 5, 12, '/images/Zelena.webp'), 
    ('Archie Hopper', TRUE, 1, 13, '/images/Archie.jpg'),
    ('Robin Hood', FALSE, 2, 14, '/images/Robin.webp'), 
    ('Neal Cassidy', FALSE, 1, 15, '/images/Neal.jpg'),
    ('Ruby', TRUE, 1, 16, '/images/Ruby.webp'),
    ('Widow Lucas', TRUE, 1, 17, '/images/Granny1.webp'),
    ('Malcolm', FALSE, 2, 18, '/images/Malcolm.jpg'),
    ('Felix', FALSE, 3, 19, '/images/Felix.gif');

    SELECT COUNT(*) FROM people;