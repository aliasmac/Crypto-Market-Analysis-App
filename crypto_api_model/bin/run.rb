require 'pry'
require_relative '../config/environment'
require_relative '../app/models/currency.rb'
require_relative '../app/models/transactions.rb'
require_relative '../app/models/user.rb'

cur = Currency.first
cur.get_api_data

binding.pry
puts "HELLO WORLD"
