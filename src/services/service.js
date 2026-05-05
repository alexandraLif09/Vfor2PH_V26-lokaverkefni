const db = require('../lib/db');

const getAllPeople = async () => {
    const result = await db.query('SELECT * FROM people ORDER BY id ASC');
    return result.rows;
};

const getAllPlaces = async () => {
    const result = await db.query('SELECT id, name FROM places ORDER BY name ASC');
    return result.rows;
};

const getAllCharacters = async () => {
    const result = await db.query('SELECT id, name FROM characters ORDER BY name ASC');
    return result.rows;
};

const getPeopleById = async (id) => {
    const result = await db.query(`
        SELECT
            p.*,
            c.name AS character_name,
            h.name AS home_name,
            pl.name AS place_name
        FROM people p
        JOIN characters c ON p.characterID = c.id
        JOIN homes h ON c.homeID = h.id
        JOIN places pl ON p.placeID = pl.id
        WHERE p.id = $1
    `, [id]);
    if (result.rows.length === 0) {
        return null;
    }
    return result.rows[0];
};

const createPeople = async (name, alive, placeID, characterID, image_url) => {
    const sql = `
        INSERT INTO people (name, alive, placeID, characterID, image_url)
        VALUES ($1, $2, $3, $4, $5)
        RETURNING *;
    `;

    const values = [name, alive, placeID, characterID, image_url];
    const result = await db.query(sql, values);

    return result.rows[0];
};

module.exports = {
    getAllPeople,
    getAllPlaces,
    getAllCharacters,
    getPeopleById,
    createPeople
};