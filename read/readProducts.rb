$:.push './'
require_relative '../models/product.rb'
require_relative '../models/category.rb'

def read_product(name, code, price, quantity, category_id)

  if Product.exists?(code: code)
    puts "Error: A product with code '#{code}' already exists."
    return
  end

  category = Category.find_by(id: category_id)

  unless category
    puts "Category with ID #{category_id} not found."
    return
  end

  product = Product.new
  product.name = name
  product.code = code
  product.price = price
  product.quantity = quantity
  product.category_id = category_id

  if product.save
    puts "Product '#{product.name}' saved successfully with ID #{product.id}."
  else
    puts "Failed to save product:"
    product.errors.full_messages.each { |msg| puts "- #{msg}" }
  end
end

