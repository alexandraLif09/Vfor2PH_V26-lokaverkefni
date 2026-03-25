const { Pool } = require('pg');

const pool = new Pool({
    connectionString: process.env.DATBASE_URL
});

module.exports = {
    query: (text, params) => pool.query(text, params),
};