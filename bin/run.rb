require 'pry'
require_relative '../config/environment'
require_relative '../app/models/currency.rb'
require_relative '../app/models/transactions.rb'
require_relative '../app/models/user.rb'

#program logic:

#User data is already seeded


ali = User.create(name: "Ali")
ali.activate_account
ali.add_usd_to_balance(15000)
ali.buy_crypto_currency("btc", 2)

binding.pry





puts "HELLO WORLD"
