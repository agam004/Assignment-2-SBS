const express = require('express');
const router = express.Router();
const { Inventory } = require('../models/Inventory');
const { Sales } = require('../models/Sales');

// Sales Page: Display all sales transactions and total revenue
router.get('/', async (req, res) => {
  const sales = await Sales.findAll({ include: { model: Inventory } });
  const totalRevenue = await Sales.sum('totalSaleAmount') || 0;
  res.render('sales', { sales, totalRevenue });
});

// Sell Item Page: Display a form to sell a specific inventory item
router.get('/sell/:id', async (req, res, next) => {
  const item = await Inventory.findByPk(req.params.id);
  if (!item) {
    const error = new Error("Item not found");
    error.status = 404;
    return next(error);
  }
  res.render('sell', { item });
});

// Process a Sale: Validate and update inventory
router.post('/sell/:id', async (req, res, next) => {
  const { quantity } = req.body;
  const sellQuantity = parseInt(quantity, 10);
  const item = await Inventory.findByPk(req.params.id);

  // Validate that item exists and there is sufficient stock
  if (!item) {
    const error = new Error("Item not found");
    error.status = 404;
    return next(error);
  }
  if (item.quantity < sellQuantity) {
    const error = new Error("Not enough stock to sell");
    error.status = 404;
    return next(error);
  }

  const totalSaleAmount = item.price * sellQuantity;

  // Create a new sales record
  await Sales.create({
    itemId: item.id,
    quantitySold: sellQuantity,
    pricePerItem: item.price,
    totalSaleAmount
  });

  // Update inventory: reduce stock
  await item.update({ quantity: item.quantity - sellQuantity });

  res.redirect('/sales');
});

module.exports = router;
