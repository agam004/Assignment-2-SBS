const { Sequelize, DataTypes } = require('sequelize');
const { sequelize } = require('./Inventory');
const Inventory = require('./Inventory').Inventory;

const Sales = sequelize.define('Sales', {
  id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
  itemId: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: { model: Inventory, key: 'id' }
  },
  quantitySold: { type: DataTypes.INTEGER, allowNull: false, validate: { min: 1 } },
  pricePerItem: { type: DataTypes.FLOAT, allowNull: false },
  totalSaleAmount: { type: DataTypes.FLOAT, allowNull: false },
  saleDate: { type: DataTypes.DATE, defaultValue: Sequelize.NOW }
}, { timestamps: false });

// Set up the foreign key relationship
Sales.belongsTo(Inventory, { foreignKey: 'itemId' });

module.exports = { Sales };
