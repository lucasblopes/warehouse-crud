$:.push './'

require_relative '../models/productdetail.rb'
require_relative '../create/createProductDetails.rb'

def delete_productdetails(condition)
    productdetail = ProductDetail.where(condition)
    if productdetail.empty?
        puts "Product Detail not found."
        return
    end
    productdetail.destroy_all
end
