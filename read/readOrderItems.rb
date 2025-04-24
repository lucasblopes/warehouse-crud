$:.push './'
require_relative '../models/orderitem.rb'
require_relative '../models/order.rb'
require_relative '../models/product.rb'

def read_order_item(order_id, product_id, quantity, unit_price)
  order = Order.find_by(id: order_id)
  product = Product.find_by(id: product_id)

  unless order
    puts "Order with ID #{order_id} not found."
    return
  end

  unless product
    puts "Product with ID #{product_id} not found."
    return
  end

  item = OrderItem.new
  item.order_id = order_id
  item.product_id = product_id
  item.quantity = quantity
  item.unit_price = unit_price

  if item.save
    puts "OrderItem for Product '#{product.name}' added to Order '#{order.order_number}'."
  else
    puts "Failed to save order item:"
    item.errors.full_messages.each { |msg| puts "- #{msg}" }
  end
end

