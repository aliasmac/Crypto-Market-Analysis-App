require 'rest-client'
require 'json'
require 'pry'

require_relative 'currency.rb'

class User < ActiveRecord::Base
  has_many :transactions
  has_many :currencies, through: :transactions

  @user_balance = 1000

  #Is amount in USD or Crypto?
  #Either way we need to convert the money

  def get_balance
    @user_balance
  end

  #How much crypto would you like to buy?
  #They must enter correct symbol


  def buy_crypto_currency(currency, amount)
    coin = currency.downcase.upcase
    coins = ["BTC", "ETH", "XRP", "BCH", "EOS", "XLM", "LTC", "YSDT", "ADA", "XMR"]

    if coins.include?(coin)
      price = amount * get_market_quote(currency)
      puts "#{amount} #{coin} will cost you #{price} and you current balance is #{@user_balance}."
    else
      puts "You have entered an incorrct symbol"
    end

    # Transactions.create(currency_id: currency.id, user_id: self.id, amount: amount)
    # @user_balance -= amount
  end

  def sell_crypto_currency(currency)
    Transactions.create(currency_id: currency.id, user_id: self.id, amount: amount)
    @user_balance += amount
  end

end
