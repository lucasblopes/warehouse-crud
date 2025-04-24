$:.push './'

require_relative '../models/productdetail.rb'

def list_product_details()
    productdetail = ProductDetail.all
    puts "----------Product Details----------"
    puts
    productdetail.each do |pd|
        puts "product Detail ID: #{pd.id}"
        product = pd.product
        puts "Product Name: #{product&.name || 'N/A'}"
        puts "Description: #{pd.description}"
        puts "Location: #{pd.location}"
        puts "Manufactor: #{pd.manufactor}"
        puts
    end
end
