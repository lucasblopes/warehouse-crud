$:.push './'

require_relative '../models/productdetail.rb'

def update_product_details(id, update)
    detail = ProductDetail.where(id)
    if detail.empty?
        puts "ProductDetail not found."
        return
    end
    detail.update_all(update)
end

