require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "tables/Tables.sqlite3"

class ProductDetail < ActiveRecord::Base
    belongs_to :product

    validates :product_id, uniqueness: true
end
