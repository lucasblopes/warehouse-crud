$:.push './'

require_relative '../models/category.rb'

def list_categories()
    categories = Category.all
    puts "----------Categories----------"
    puts
    categories.each do |category|
        puts "Category ID: #{category.id}"
        puts "Name: #{category.name}"
        puts
    end
end
