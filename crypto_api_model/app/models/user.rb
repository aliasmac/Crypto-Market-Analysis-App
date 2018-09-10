class User < ActiveRecord::Base
  has_many :transactions
  has_many :currencies, through: :transactions

  @user_balance = 1000

  #Is amount in USD or Crypto?
  #Either way we need to convert the money 
  def buy_crypto_currency(currency:, amount:)
    Transactions.create(currency_id: currency.id, user_id: self.id, amount: amount)
    @user_balance -= amount
  end

  def sell_crypto_currency(currency)
    Transactions.create(currency_id: currency.id, user_id: self.id, amount: amount)
    @user_balance += amount
  end

end
