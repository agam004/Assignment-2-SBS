const express = require('express');
const bodyParser = require('body-parser');
const { sequelize } = require('./models/Inventory');
const inventoryRoutes = require('./routes/Inventory');
const salesRoutes = require('./routes/sales');
const ledgerRoutes = require('./routes/ledger');
const path = require('path');

require('dotenv').config();
//All importing Stuff

const app = express();
//creating an instance of express app

app.set('view engine', 'ejs');
//setting the view engine to ejs
app.use(bodyParser.urlencoded({ extended: false }));
//using body parser to parse the incoming request body

app.use('/', inventoryRoutes);
app.use('/sales', salesRoutes);
app.use('/ledger', ledgerRoutes);
//using the defined inventory Routes in file routes/Inventory.js

sequelize.authenticate().then(() => {
    console.log('Database connected Successfully :)');
    try{
        app.listen(3870, () => console.log(`Server started on http://localhost:3870\nPress Ctrl-C to terminate\nHello Proffessor, How are you doing?  :)`));
    }
    catch(err){
        console.log('Error while starting server:', err);}
}).catch(err => console.error('DB Connection Error:', err));

// Catch-all error handler
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(err.status || 500);
    res.render('error', { error: err });
  });
  