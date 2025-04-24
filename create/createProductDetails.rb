require 'rubygems'
require 'active_record'
require 'sqlite3'

# Establish connection to the SQLite database
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "tables/Tables.sqlite3")

# Check if the table exists
unless ActiveRecord::Base.connection.table_exists?(:product_details)
  # Create the product_details table
  ActiveRecord::Base.connection.create_table :product_details, id: false do |t|
    t.integer :product_id, null: false # Explicitly add product_id as an integer
    t.string :description
    t.string :location
    t.string :manufactor

    # Add a foreign key constraint
    t.foreign_key :products, column: :product_id
    t.index :product_id, unique: true
  end

  # Create an index on product_id if it doesn't exist
  unless ActiveRecord::Base.connection.indexes(:product_details).any? { |i| i.name == 'index_product_details_on_product_id' }
    ActiveRecord::Base.connection.add_index :product_details, :product_id, unique: true
  end

  puts "Table 'product_details' created successfully."
else
  puts "Table 'product_details' already exists."
end

