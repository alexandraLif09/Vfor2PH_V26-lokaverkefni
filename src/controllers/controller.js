const peopleService = require('../services/service');

const getHomePage = async (req, res) => {
    try {
        const people = await peopleService.getAllPeople();

        res.render('index', {
            title: 'Once Upon A Time',
            people: people
        });
    } catch (error) {
        console.error('Villa við að sækja manneskju', error);
        res.status(500).send('Kerfisvilla - Get ekki hlaðað manneskju');
    };
};

module.exports = {
    getHomePage
};