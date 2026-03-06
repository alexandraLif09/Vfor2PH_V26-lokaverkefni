const express = require('express');
const path = require('path');

const ouatRouter = require('./src/routes/routes');

const app = express();
const PORT = 3000;

app.set('view engine', 'ejs');
app.use(express.static(Path.join(__dirname, 'public')));

app.use('/', oautRouter);