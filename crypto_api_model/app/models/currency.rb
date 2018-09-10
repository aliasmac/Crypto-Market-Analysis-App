require 'rest-client'
require 'json'
require 'pry'

# require_relative 'example_hash.json'

class Currency < ActiveRecord::Base
  has_many :transactions
  has_many :users, through: :transactions

  def coins_you_can_buy
    p "Thank you for choosing Crypto Billionaire'/s, we're here to make your dreams come true"
    p "We sell the follwoing cryptocurrencies:"
    p "- Bitcoin"
    p "- Ethereum"
    p "- XRP (Ripple)"
    p "- Bitcoin Cash"
    p "- EOS"
    p "- Stellar"
    p "- Litecoin"
    p "- Tether"
    p "- Cardano"
    p "- Monero"
    p "Make you choice!"
  end

  def get_api_data
    # file = RestClient.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?&CMC_PRO_API_KEY=ec5d4736-f3ee-4f03-b8b8-1e1c82acba47")
    file2 = File.read('app/models/example_hash.json')
    data_hash = JSON.parse(file2)
  end

  def get_latest_prices
    # Lists USD price for each individual token for all currencies and displays alphabetically.
    get_api_data["data"].each do |coin_hash|
      p "#{coin_hash["name"]}: $#{coin_hash["quote"]["USD"]["price"].round(2)}"
    end
  end

  #Please enter the name of the cruptocurrency you would like to buy"

  def get_market_quote(currency)
    # Takes in an argument of one of 10 currencies and returns the price for named currency.
    get_api_data["data"].each do |coin_hash|
      if coin_hash["name"] == currency.downcase.capitalize
        p "#{currency.downcase.capitalize} is currently priced at: $#{coin_hash["quote"]["USD"]["price"].round(2)}"
      end
    end

  end

  def get_top_ten
    # Lists prices for all currencies by market cap.
  end

end
