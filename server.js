require('dotenv').config();

const express = require('express');
const path = require('path');
const routes = require('./src/routes/routes');

const app = express();
const PORT = process.env.PORT || 3000;

app.set('view engine', 'ejs');

app.set('views', path.join(__dirname, 'src', 'views'));
app.use(express.static(path.join(__dirname, 'public')));

app.use(express.urlencoded({extended: true}))

app.use('/', routes);

app.listen(PORT, () => {
    console.log(`Server keyrir á http://localhost:${PORT}`);
});