$:.push './'

require_relative '../models/orderitem.rb'
require_relative '../create/createOrderItems.rb'

def delete_orderitems(condition)
    orderitems = OrderItem.where(condition)
    if orderitems.empty?
        puts "Order Item not found."
        return
    end
    orderitems.destroy_all
end
