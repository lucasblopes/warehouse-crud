$:.push './'

require_relative '../models/category.rb'
require_relative '../create/createCategories.rb'

def delete_categories(condition)
    category = Caregory.where(condition)
    if category.empty?
        puts "Category not found."
        return
    end
    category.destroy_all
end
