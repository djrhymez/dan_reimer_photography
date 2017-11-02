class Client < ApplicationRecord
  validates :name, :email, :password, presence: true
  has_many :orders
  has_one :wishlist
end
