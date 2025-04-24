$:.push '/'

require_relative '../models/orderitem.rb'

def list_order_items
  order_items = OrderItem.includes(:order, :product).all
  puts "----------Order Items----------"
  puts
  order_items.each do |item|
    puts "Order Item ID: #{item.id}"
    puts "Order Number: #{item.order&.order_number || 'N/A'}"
    puts "Product Name: #{item.product&.name || 'N/A'}"
    puts "Quantity: #{item.quantity}"
    puts "Unit Price: $#{item.unit_price}"
    puts "Total Price: $#{(item.unit_price * item.quantity).round(2)}"
    puts
  end
end

