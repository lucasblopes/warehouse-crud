$:.push './'
require_relative '../models/category.rb'

def read_category(name, description = nil)
  # Check if a category with this name already exists
  if Category.exists?(name: name)
    puts "Error: A category with name '#{name}' already exists."
    return
  end
  
  category = Category.new
  category.name = name
  category.description = description
  
  if category.save
    puts "Category '#{category.name}' saved successfully with ID #{category.id}."
  else
    puts "Failed to save category:"
    category.errors.full_messages.each { |msg| puts "- #{msg}" }
  end
end
