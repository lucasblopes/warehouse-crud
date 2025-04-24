require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "tables/Tables.sqlite3"

class Product < ActiveRecord::Base
    belongs_to :category
    has_one :product_detail, dependent: :destroy
    has_many :order_items, dependent: :destroy
    has_many :orders, through: :order_items

    validates :name, :code, presence: true
end
