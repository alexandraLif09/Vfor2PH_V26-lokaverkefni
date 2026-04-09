const express = require('express');
const router = express.Router();
const controller = require('../controllers/controller');

router.get('/', controller.getHomePage);
router.get('/person/ny', controller.getAddPersonForm);
router.post('/person/ny', controller.createNewPerson);
router.get('/person/:id', controller.getPeopleDetails);

module.exports = router;