$:.push './'

require_relative '../models/productdetail.rb'

def update_products(id, update)
    product = Product.where(id)
    if product.empty?
        puts "Product not found."
        return
    end
    product.update_all(update)
end
