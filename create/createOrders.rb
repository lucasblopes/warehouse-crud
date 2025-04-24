require 'rubygems'
require 'active_record'
require 'sqlite3'

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "tables/Tables.sqlite3")

unless ActiveRecord::Base.connection.table_exists?(:orders)
  ActiveRecord::Base.connection.create_table :orders do |t|
    t.string :order_number, null: false
    t.date :date, null: false
    t.string :status
    t.index :order_number, unique: true
  end

  puts "Table 'orders' created successfully."
else
  puts "Table 'orders' already exists."
end

