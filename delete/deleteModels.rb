$:.push './'

require_relative 'deleteCategories.rb'
require_relative 'deleteOrderItems.rb'
require_relative 'deleteOrders.rb'
require_relative 'deleteProductDetails.rb'

def delete_models(model, condition)

    if model == "categories"
        delete_categories(condition)
    elsif model == "orderitems"
        delete_orderitems(condition)
    elsif model == "orders"
        delete_orders(condition)
    elsif model == "productdetails"
        delete_productdetails(condition)
    end
end
