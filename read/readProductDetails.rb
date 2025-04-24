$:.push './'
require_relative '../models/productdetail.rb'

def read_product_detail(product_id, description, location, manufactor)

    if ProductDetail.exists?(product_id: product_id)
      puts "Error: A product detail with product_id '#{product_id}' already exists."
      return
    end

    pd = ProductDetail.new()
    pd.product_id = product_id
    pd.description = description
    pd.location = location
    pd.manufactor = manufactor

    if pd.save
      puts "ProductDetail for product ID #{pd.product_id} saved successfully."
    else
      puts "Failed to save ProductDetail:"
      pd.errors.full_messages.each { |msg| puts "- #{msg}" }
    end
end
