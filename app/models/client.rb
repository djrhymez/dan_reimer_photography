class Client < ApplicationRecord
  has_many :orders
  has_one :wishlist
end
