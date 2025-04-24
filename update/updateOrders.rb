$:.push './'

require_relative '../models/order.rb'

def update_orders(id, update)
    order = Order.where(id)
    if order.empty?
        puts "Order not found."
        return
    end
    order.update_all(update)
end

