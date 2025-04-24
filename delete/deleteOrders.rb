$:.push './'

require_relative '../models/order.rb'
require_relative '../create/createOrders.rb'

def delete_orders(condition)
    order = Order.where(condition)
    if order.empty?
        puts "Order not found."
        return
    end
    order.destroy_all
end
