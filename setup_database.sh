rm -f tables/Tables.sqlite3*

ruby create/createCategories.rb
ruby create/createOrderItems.rb
ruby create/createOrders.rb
ruby create/createProductDetails.rb
ruby create/createProducts.rb
