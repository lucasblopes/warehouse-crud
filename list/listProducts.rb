$:.push '/'

require_relative '../models/product.rb'

def list_products()
    products = Product.all
    puts "----------Products----------"
    puts
    products.each do |product|
        puts "Product ID: #{product.id}"
        puts "Name: #{product.name}"
        puts "Code: #{product.code}"
        puts "Quantity: #{product.quantity}"
        puts "Price: #{product.price}"
        category = product.category
        puts "Category: #{category&.name || 'N/A'}"
        puts
    end
end
