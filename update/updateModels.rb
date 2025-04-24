$:.push './'

require_relative 'updateOrders.rb'
require_relative 'updateOrderItems.rb'
require_relative 'updateProducts.rb'
require_relative 'updateProductDetails.rb'

def update_models(table, id, update)
    case table
    when "orders"
        update_orders(id, update)
    when "orderitems"
        update_order_items(id, update)
    when "products"
        update_products(id, update)
    when "productdetails"
        update_product_details(id, update)
    else
        puts "Unknown table: #{table}"
    end
end

