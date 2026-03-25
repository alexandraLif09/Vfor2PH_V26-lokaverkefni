const db = require('../lib/db');

const getAllPeople = async () => {
    const result = await db.query('SELECT * FROM people ORDER BY id ASC');
    return result.rows;
};

module.exports = {
    getAllPeople
};