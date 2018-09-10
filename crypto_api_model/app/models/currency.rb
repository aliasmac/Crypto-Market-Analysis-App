require 'rest-client'
require 'json'
require 'pry'

# require_relative 'example_hash.json'

class Currency < ActiveRecord::Base
  has_many :transactions
  has_many :users, through: :transactions

  def get_api_data
    # file = RestClient.get("https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?&CMC_PRO_API_KEY=ec5d4736-f3ee-4f03-b8b8-1e1c82acba47")
    file2 = File.read('app/models/example_hash.json')
    data_hash = JSON.parse(file2)
  end

  def get_latest_prices
    # Lists USD price for each individual token for all currencies and displays alphabetically.
  end

  def get_market_quote(currency)
    # Takes in an argument of one of 10 currencies and returns the price for named currency.
  end

  def get_top_ten
    # Lists prices for all currencies by market cap.
  end

end
