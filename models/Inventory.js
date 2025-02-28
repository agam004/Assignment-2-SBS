const { Sequelize, DataTypes } = require('sequelize');
require('dotenv').config();

const sequelize = new Sequelize(process.env.DATABASE_URL, { dialect: 'postgres', logging: false });

const Inventory = sequelize.define('Inventory', {
    id: { type: DataTypes.INTEGER, autoIncrement: true, primaryKey: true },
    name: { type: DataTypes.STRING, allowNull: false },
    quantity: { type: DataTypes.INTEGER, allowNull: false, validate: { min: 0 } },
    price: { type: DataTypes.FLOAT, allowNull: false },
    description: { type: DataTypes.TEXT }
}, { timestamps: false });

module.exports = { Inventory, sequelize };
