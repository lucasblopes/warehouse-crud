require 'active_record'

ActiveRecord::Base.establish_connection :adapter => "sqlite3",
                                        :database => "tables/Tables.sqlite3"

class Category < ActiveRecord::Base
    has_many :products

    validates :name, presence: true
end
