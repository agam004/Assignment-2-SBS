const express = require('express');
const router = express.Router();
const { Inventory } = require('../models/Inventory');

// List all items on home page
router.get('/', async (req, res) => {
    const items = await Inventory.findAll();
    res.render('index', { items });
});

// get route for add item form
router.get('/add', (req, res) => {
    res.render('add');
});

// post route to add a new item and save to server and redirect to home page using inventory model
router.post('/add', async (req, res) => {
    const { name, quantity, price, description } = req.body;
    await Inventory.create({ name, quantity, price, description });
    res.redirect('/');
});

// get Edit route to render the edit form
router.get('/edit/:id', async (req, res) => {
    const item = await Inventory.findByPk(req.params.id);
    res.render('edit', { item });
});

//post edit route after user submits
router.post('/edit/:id', async (req, res) => {
    const { name, quantity, price, description } = req.body;
    await Inventory.update({ name, quantity, price, description }, { where: { id: req.params.id } });
    res.redirect('/');
});

// delete route
router.post('/delete/:id', async (req, res) => {
    await Inventory.destroy({ where: { id: req.params.id } });
    res.redirect('/');
});

module.exports = router;
//exporting the router to be used in server.js