require 'rubygems'
require 'active_record'
require 'sqlite3'

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "tables/Tables.sqlite3")

unless ActiveRecord::Base.connection.table_exists?(:order_items)
  ActiveRecord::Base.connection.create_table :order_items do |t|
    t.references :order, foreign_key: true
    t.references :product, foreign_key: true
    t.integer :quantity
    t.float :unit_price
  end

  puts "Table 'order_items' created successfully."
else
  puts "Table 'order_items' already exists."
end

