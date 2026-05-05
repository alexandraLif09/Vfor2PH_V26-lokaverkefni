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
        res.status(500).send('Kerfisvilla - Get ekki hlaðið manneskju');
    };
};

const getPeopleDetails = async (req, res) => {
    try {
        const id = req.params.id;
        const people = await peopleService.getPeopleById(id);

        if (!people) {
            return res.status(404).send('Fann ekki manneskju.');
        }

        res.render('details', {
            title: people.name,
            people: people
        });
    } catch (error) {
        console.error('Villa við að sækja staka manneskju.', error);
        res.status(500).send('Kerfisvilla - get ekki hlaðið manneskju. (500)');
    }
};

const getAddPersonForm = async (req, res) => {
    try {
        const places = await peopleService.getAllPlaces();
        const characters = await peopleService.getAllCharacters();

        res.render('add-person', {
            title: 'Bæta við manneskju',
            places,
            characters
        });
    } catch (error) {
        console.error('Villa við að sækja valmöguleika fyrir formið:', error);
        res.status(500).send('Kerfisvilla - Get ekki hlaðið formið');
    }
};

const createNewPerson = async (req, res) => {
    try {
        const {name, alive, placeID, characterID, image_url} = req.body;
        const aliveBool = alive === 'true' || alive === 'on';
        const placeId = parseInt(placeID, 10);
        const characterId = parseInt(characterID, 10);

        if (!name) {
            return res.status(400).send('Nafn á manneskju má ekki vera tómt!');
        }

        if (!placeId || !characterId) {
            return res.status(400).send('Veldu gilda staðsetningu og karakter.');
        }

        const newPerson = await peopleService.createPeople(name, aliveBool, placeId, characterId, image_url);

        res.redirect(`/person/${newPerson.id}`);
    } catch (error) {
        console.error('Villa við að búa til manneskju:', error);
        res.status(500).send('Kerfisvilla - Tókst ekki að vista manneskju');
    }
};

module.exports = {
    getHomePage,
    getPeopleDetails,
    getAddPersonForm,
    createNewPerson
};