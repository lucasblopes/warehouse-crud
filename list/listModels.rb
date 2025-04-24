$:.push './'

require_relative 'listCategories.rb'
require_relative 'listOrderItems.rb'
require_relative 'listOrders.rb'
require_relative 'listProductDetails.rb'
require_relative 'listProducts.rb'

def list_models(model)
    if model == "categories"
        list_categories()
    elsif model == "orderitems"
        list_order_items()
    elsif model == "orders"
        list_orders()
    elsif model == "productdetails"
        list_product_details()
    elsif model == "products"
        list_products()
    end
end
