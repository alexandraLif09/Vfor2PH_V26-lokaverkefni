const peopleService = require('../services/service');

const getHomePage = async (req, res) => {
    try {
        const people = await ServiceWorker.getAllPeople();

        res.render('index', {
            title: 'Once Upon A Time'
            ('Það á að vera eitthvað hér, veit ekki hvað.')
        });
    } catch (error) {
        console.error('Villa við að sækja manneskju', error);
        res.status(500).send('Kerfisvilla - Get ekki hlaðað manneskju');
    };
};

module.exports = {
    getHomePage
};