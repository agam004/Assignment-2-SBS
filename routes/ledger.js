const express = require('express');
const router = express.Router();
const { Inventory } = require('../models/Inventory');
const { Sales } = require('../models/Sales');

// Ledger Report: Combine inventory additions (debit) and sales (credit)
router.get('/', async (req, res) => {
  const inventoryItems = await Inventory.findAll();
  const sales = await Sales.findAll({ include: { model: Inventory } });

  // Create a ledger array
  let ledger = [];

  // Debit entry for each inventory item added (using quantity * price as value)
  inventoryItems.forEach(item => {
    ledger.push({
      quantity: item.quantity,
      description: `Added ${item.name}`,
      debit: item.price * item.quantity,
      credit: 0
    });
  });

  // Credit entry for each sale made
  sales.forEach(sale => {
    ledger.push({
      quantity: sale.Inventory.quantity, // updated inventory quantity
      description: `Sold ${sale.Inventory.name}`,
      debit: 0,
      credit: sale.totalSaleAmount
    });
});


  res.render('ledger', { ledger , inventoryItems });
});

module.exports = router;
