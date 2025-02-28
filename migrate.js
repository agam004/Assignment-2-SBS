const { Inventory, sequelize } = require('./models/Inventory');

(async () => {
    await sequelize.sync({ force: true });

    let data = [
        { name: "Laptop", quantity: 10, price: 900.00, description: "High-end gaming laptop" },
        { name: "Monitor", quantity: 0, price: 150.00, description: "24-inch LED screen" },
        { name: "Keyboard", quantity: 30, price: 50.00, description: "Mechanical keyboard" },
        { name: "Mouse", quantity: 50, price: 20.00, description: "Wireless mouse" }
    ];

    await Inventory.bulkCreate(data);
    console.log("Data migrated Successfully"); //data migration confirmation
    process.exit();
})();
//Fixed all the issues in excel data provided and pushed the data to the database using this file