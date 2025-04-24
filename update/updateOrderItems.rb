$:.push './'

require_relative '../models/orderitem.rb'

def update_order_items(id, update)
    order_item = OrderItem.where(id)
    if order_item.empty?
        puts "OrderItem not found."
        return
    end
    order_item.update_all(update)
end

