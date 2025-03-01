# Inventory Management System


## Git Repository For This File: 
https://github.com/agam004/Assignment-2-SBS

## Overview
This is a simple **Inventory Management System** built using **Node.js, Express, Sequelize, and PostgreSQL** (hosted on Neon.tech). The system provides an easy way to manage inventory items with basic CRUD operations.

## New Features (Assignment 2)
- **Sales Page:** Lists all sales transactions with detailed item information.
- **Sell Item Page:** Provides a form to process sales of inventory items.
- **Inventory Update:** Automatically reduces stock when a sale is made, with validation to prevent negative stock.
- **Total Revenue Calculation:** Displays the total revenue generated from all sales.
- **Basic Ledger Report:** Tracks transactions as debits (inventory additions) and credits (sales), including Table for remaining stock.

## Features
✅ View all inventory items  
✅ Add new inventory items  
✅ Edit existing inventory items  
✅ Delete inventory items  
✅ Sales transaction processing and inventory updates  
✅ Total revenue and ledger calculations  
✅ Data validation and error handling  
✅ Professional styling using Bootstrap  

## Tech Stack
- **Backend:** Node.js, Express, Sequelize  
- **Database:** PostgreSQL (Neon.tech)  
- **Frontend:** EJS, Bootstrap, HTML, CSS  
- **Tools & Packages:**  
  - `express` (for server handling)  
  - `sequelize` (ORM for PostgreSQL)  
  - `pg` & `pg-hstore` (PostgreSQL client)  
  - `ejs` (Template engine)  
  - `body-parser` (Handling form data)  
  - `cors` (Handling cross-origin requests)  

## Setup Instructions

## 1. Install packages: It will be done autonatically just run in the app console
    "npm install"
## 2. After that run  :

    "nodemon start" OR "node start"

# (Optional Step) (Only Use if no data appears on homepage)
## 3. Migrate Data to neon : 
    "node migrate.js"


## The app will be running at:
🔗 http://localhost:3870


## The system corrects the following errors before storing data (As mentioned in instructions):

#### Negative Quantity: Changed to 0 if negative.
#### Invalid Price Format: Ensures the price is a valid number.
#### Duplicate Entries: Prevents adding identical items.
#### Insufficient Stock: Prevents processing a sale if available stock is less than the requested quantity.

# Sales and Ledger Functionality
## Sales Transactions: Records include quantity sold, price per item, total sale amount, and sale date.
## Ledger Report: Aggregates debit entries (inventory additions) and credit entries (sales), along with:
## Modified Stock: The number of items changed in the transaction.
## Remaining Stock: The current inventory level after the transaction.
## 
👤 Guragampreet Singh
🎓 Student Number: 8913870
📅 Submission Date: 10/02/2025


