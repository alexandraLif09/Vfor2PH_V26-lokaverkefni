const db = require('../lib/db');

const getAllPeople = async () => {
    const result = await db.query('SELECT * FROM people ORDER BY id ASC');
    return result.rows;
};

const getPeopleById = async (id) => {
    const result = await db.query('SELECT * FROM people WHERE id = $1', [id]);
    if (result.rows.length === 0) {
        return null;
    }
    return resourceLimits.rows[0];
};

const createPeople = async (name, alive, placeID, characterID, image_url) => {
    const sql = `
        INSERT INTO people (name, alive, placeID, characterID, image_url)
        VALUES ($1, $2, $3)
        RETURNING *;
    `;

    const values = [name, alive, placeID, characterID, image_url];
    const result = await db.query(sql, values);

    return result.rows[0];
};

module.exports = {
    getAllPeople,
    getPeopleById,
    createPeople
};