$:.push './'
require_relative '../models/order.rb'

def read_order(order_number, date, status)

    if Order.exists?(order_number: order_number)
      puts "Error: A Order with order_number '#{order_number}' already exists."
      return
    end

    o = Order.new()
    o.order_number = order_number
    o.date = date
    o.status = status

    if o.save
      puts "Order '#{o.order_number}' saved successfully with ID #{o.id}."
    else
      puts "Failed to save order:"
      product.errors.full_messages.each { |msg| puts "- #{msg}" }
    end
end
