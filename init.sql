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