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
    alive BIT NOT NULL,
    placeID INT NOT NULL,
    characterID INT NOT NULL,
    image_url VARCHAR(500)

    CONSTRAINT fk_place
        FOREIGN KEY(placeID)
        REFERENCES places(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_character
        FOREIGN KEY(characterID)
        REFERENCES Characters(id)
        ON DELETE RESTRICT
);

TRUNCATE TABLE users RESTART IDENTITY;
TRUNCATE TABLE places RESTART IDENTITY;
TRUNCATE TABLE homes RESTART IDENTITY;
TRUNCATE TABLE characters RESTART IDENTITY;
TRUNCATE TABLE people RESTART IDENTITY;



INSERT INTO places (name) 
VALUES ('Storybrooke'), ('Enchanted Forest'), 
    ('Neverland'), ('Wonderland'), 
    ('Oz'), ('Underworld'), 
    ('DunBroch'), ('Agrabah'), ('Wish Realm');

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
VALUES ('Emma Swan', 'True', 1, 1, '', ), 
    ('Henry Mills', 'True', 1, 2, ''),
    ('Regina Mills', 'True', 1, 3, ''),
    ('Killian Jones', 'True', 2, 4, ''),
    ('Mary Margaret', 'True', 1, 5, ''), 
    ('David Nolan', 'True', 1, 6, ''),
    ('Mr. Gold', 'False', 1, 7, ''),
    ('Belle', 'False', 1, 8, ''),
    ('Reul Ghorm', 'True', 1, 9, ''),
    ('Jefferson', 'True', 1, 10, ''),
    ('Sheriff graham Humbert', 'False', 1, 11, ''),
    ('Zelena', 'True', 5, 12, ''), 
    ('Archie Hopper', 'True', 1, 13, ''),
    ('Robin Hood', 'False', 2, 14, ''), 
    ('Neal Cassidy', 'False', 1, 15, ''),
    ('Ruby', 'True', 1, 16, ''),
    ('Widow Lucas', 'True', 1, 17, ''),
    ('Malcolm', 'False', 2, 18, ''),
    ('Felix', 'False', 3, 19, '');