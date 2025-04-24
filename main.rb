$:.push './'

require 'read/readModels.rb'
require 'list/listModels.rb'
require 'delete/deleteModels.rb'
require 'update/updateModels.rb'

def format_input(string)
  formatted_attribute = []

  string.each do |attribute|
    quote_matches = attribute.scan(/(\w+)="([^"]+)"/)
    
    no_quote_matches = attribute.scan(/(\w+)=(\d+)/)
    
    formatted_attribute += quote_matches + no_quote_matches
  end
  
  return formatted_attribute
end

def split_attributes(attributes)
    attribute, value = attributes.split("=", 2)
    value = value.gsub(/"/, "")
    condition = {}
    condition[attribute.to_sym] = value
    return condition
end

def info()
    puts "Para inserir, digite: insere <nome_modelo> <atributo1> <atributo2> ..."
    puts "Para alterar, digite: altera <nome_modelo> <id_modelo> <atributo>=<valor> ..."
    puts "Para excluir, digite: exclui <nome_modelo> <id_modelo>"
    puts "Para listar, digite: lista <nome_modelo>"
    puts "Para sair, digite: exit"
    puts
    puts "+--------------Atributos--------------+"
    puts "categories = {name=\"String\", description=\"String\"}"
    puts "products = {name=\"String\", code=\"String\", quantity=\"int\", price=\"int\", category_id=\"int\"}"
    puts "productdetails = {product_id=\"int\", description=\"String\", location=\"String\", manufactor=\"String\"}"
    puts "orders = {order_number=\"String\", date=\"yyyy-mm-dd\", status=\"String\"}"
    puts "orderitems = {order_id=\"int\", product_id=\"int\", quantity=\"int\", unit_price=\"float\"}"
    puts
end

info()

attributes = []
input = gets.chomp

while input != "exit"

    parts = input.scan(/(?:[^" ]|"[^"]*")+/).map(&:strip)
    if parts.length > 2
        attributes += format_input(parts[2..-1])
    end

    if parts[0] == "insere"
        read_models(parts[1], attributes)
    elsif parts[0] == "altera"
        id_condition = split_attributes(parts[2])
        update_condition = split_attributes(parts[3])
        update_models(parts[1], id_condition, update_condition)
    elsif parts[0] == "exclui"
        condition = split_attributes(parts[2])
        delete_models(parts[1], condition)
    elsif parts[0] == "lista"
        list_models(parts[1])
    end
    input = gets.chomp
end
