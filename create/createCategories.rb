require 'rubygems'
require 'active_record'
require 'sqlite3'

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "tables/Tables.sqlite3")

unless ActiveRecord::Base.connection.table_exists?(:categories)
  ActiveRecord::Base.connection.create_table :categories do |t|
    t.string :name, null: false
    t.string :description
    
    # Add a unique index on the name column
    t.index :name, unique: true
  end
  puts "Table 'categories' created successfully."
else
  puts "Table 'categories' already exists."
end
