const express = require('express');
const path = require('path');

const ouatRouter = require('./src/routes/routes');

const app = express();
const PORT = 3000;

app.set('views', path.join(__dirname, 'src', 'views'));
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', ouatRouter);

app.listen(PORT, () => {
    console.log(`Server keyrir á http://localhost:${PORT}`);
});