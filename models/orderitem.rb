require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "tables/Tables.sqlite3"

class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :product

    validates :quantity, presence: true, numericality: { greater_than: 0 }
end
