require 'rest-client'
require 'json'
require 'pry'

require_relative 'currency.rb'

class User < ActiveRecord::Base
  has_many :transactions
  has_many :currencies, through: :transactions

  #Is amount in USD or Crypto?
  #Either way we need to convert the money

  #How much crypto would you like to buy?
  #They must enter correct symbol

  attr_reader :user_balance

  def activate_account
    @user_balance = {
      USD: 0,
      BTC: 0,
      ETH: 0,
      XRP: 0,
      BCH: 0,
      EOS: 0,
      XLM: 0,
      LTC: 0,
      USDT: 0,
      ADA: 0,
      XMR: 0
    }
  end

  def add_usd_to_balance(amount)
    @user_balance[:USD] += amount
  end


  def find_currency_id(sym)
    #method needs to return an id of a symbol passed in as an argument
    currency = Currency.find_by(symbol: sym)
    currency.id
  end

  def buy_crypto_currency(symbol, amount)
    coin = symbol.downcase.upcase
    coins = ["BTC", "ETH", "XRP", "BCH", "EOS", "XLM", "LTC", "USDT", "ADA", "XMR"]
    latest_price = Currency.get_market_quote(coin)

    #if USD balance is equal to zero, you must add to account
    if coins.include?(coin)
      cost = amount * latest_price
      puts "#{amount} #{coin} will cost you #{cost} and you current balance is #{@user_balance[:USD]}."
    else
      puts "You have entered an incorrect symbol"
    end

    Transaction.create(currency_id: find_currency_id(coin),  user_id: self.id, amount: amount) #need to add where statement to look up bitcoin id to access id.
    @user_balance[:USD] -= cost
    @user_balance[currency] += amount
  end

  def sell_crypto_currency(currency)
    Transactions.create(currency_id: currency.id, user_id: self.id, amount: amount)
    @user_balance += amount
  end

  ####Insert user transaction methdods here#######

  #def get_transaction_history





end
