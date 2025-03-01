const { sequelize } = require('./models/Inventory');
const { Sales } = require('./models/Sales');

sequelize.sync({ alter: true }).then(() => {
  console.log("Database synced successfully.");
}).catch(err => console.error("Error syncing database:", err));
