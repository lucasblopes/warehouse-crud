# Warehouse Management System

## Overview

This project is a command-line warehouse management system built with **Ruby** and **ActiveRecord**, using **SQLite3** as the database. It provides operations to **insert, update, delete, and list** records from different tables.

## Database Structure

The database consists of the following tables:

1. **categories** - Stores product categories.

   - `id` (Primary Key, Auto Increment)
   - `description` (String)
   - `name` (String)

2. **products** - Stores products.

   - `id` (Primary Key, Auto Increment)
   - `name` (String)
   - `code` (Integer)
   - `quantity` (Integer)
   - `price` (Integer)
   - `category_id` (Integer)

3. **product_details** - Stores product details.

   - `product_id` (Foreign Key to `products`)
   - `description` (String)
   - `location` (String)
   - `manufactor` (String)

4. **orders** - Stores the orders for each product.

   - `id` (Primary Key, Auto Increment)
   - `order_number` (Integer)
   - `date` (Date)
   - `status` (String)

5. **order_items** - Relates orders to products.

   - `id` (Primary Key, Auto Increment)
   - `order_number` (Integer)
   - `date` (Date)
   - `status` (String)

## Relations

- One Category to N Products
- One Product to 1 Product Detail
- One Order to N Products
- N Orders to N Products through order_items

### Prerequisites

Make sure you have **Ruby** and **SQLite3** installed on your system.

## Usage

Run the program using:

1. Install required gems:

```sh
bundle install
```

2. Run the database setup:

```sh
ruby setup_database.rb
```

3. Run main program:

```sh
ruby main.rb
```

### Command Structure

The system supports the following operations:

#### Insert

```sh
insere products name="Laptop" quantity="10" category_id="1" supplier_id="2"
```

#### List

```sh
lista products
```

#### Update

```sh
altera products id="1" quantity="15"
```

#### Delete

```sh
exclui products id="1"
```

To exit, type:

```sh
exit
```

## Notes

- Foreign key constraints are enforced by ActiveRecord.
- The database file is stored in `tables/Tables.sqlite3`.

## License

This project is open-source and can be modified as needed.
