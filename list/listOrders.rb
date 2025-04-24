$:.push '/'

require_relative '../models/order.rb'

def list_orders()
    orders = Order.all
    puts "----------Orders----------"
    puts
    orders.each do |order|
        puts "Order ID: #{order.id}"
        puts "Order Number: #{order.order_number}"
        puts "Order Date: #{order.date}"
        puts "Order Status: #{order.status}"
        puts
    end
end
