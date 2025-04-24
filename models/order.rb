require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "tables/Tables.sqlite3"

class Order < ActiveRecord::Base
    has_many :order_items, dependent: :destroy
    has_many :products, through: :order_items

    validates :order_number, presence: true
end
