require 'rubygems'
require 'active_record'
require 'sqlite3'

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "tables/Tables.sqlite3")

unless ActiveRecord::Base.connection.table_exists?(:products)
  ActiveRecord::Base.connection.create_table :products do |t|
    t.string :name, null: false
    t.string :code
    t.integer :quantity
    t.integer :price
    t.references :category, foreign_key: true
    t.index :code, unique: true
  end

  puts "Table 'products' created successfully."
else
  puts "Table 'products' already exists."
end

