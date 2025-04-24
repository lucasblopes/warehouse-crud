$:.push './'

require_relative 'readOrders.rb'
require_relative 'readOrderItems.rb'
require_relative 'readProducts.rb'
require_relative 'readProductDetails.rb'
require_relative 'readCategories.rb'

def fill_hash(attribute_map, attributes)
    attributes.each do |attribute, value|
        if attribute_map.key?(attribute)
            attribute_map[attribute] = value
        end
    end
end

def read_models(table, attributes)
    if table == "categories"
        attribute_map = {
            "name" => nil,
            "description" => nil
        }
        fill_hash(attribute_map, attributes)
        read_category(attribute_map["name"], attribute_map["description"])

    elsif table == "products"
        attribute_map = {
            "name" => nil,
            "code" => nil,
            "quantity" => nil,
            "price" => nil,
            "category_id" => nil
        }
        fill_hash(attribute_map, attributes)
        read_product(attribute_map["name"], attribute_map["code"], attribute_map["quantity"], attribute_map["price"], attribute_map["category_id"])

    elsif table == "productdetails"
        attribute_map = {
            "product_id" => nil,
            "description" => nil,
            "location" => nil,
            "manufactor" => nil
        }
        fill_hash(attribute_map, attributes)
        read_product_detail(attribute_map["product_id"], attribute_map["description"], attribute_map["location"], attribute_map["manufactor"])

    elsif table == "orders"
        attribute_map = {
            "order_number" => nil,
            "date" => nil,
            "status" => nil
        }
        fill_hash(attribute_map, attributes)
        read_order(attribute_map["order_number"], attribute_map["date"], attribute_map["status"])

    elsif table == "orderitems"
        attribute_map = {
            "order_id" => nil,
            "product_id" => nil,
            "quantity" => nil,
            "unit_price" => nil
        }
        fill_hash(attribute_map, attributes)
        read_order_item(attribute_map["order_id"], attribute_map["product_id"], attribute_map["quantity"], attribute_map["unit_price"])
    end
end

