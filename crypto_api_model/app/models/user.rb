class User < ActiveRecord::Base
  has_many :transactions
  has_many :currencies, through: :transactions
end
