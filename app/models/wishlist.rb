class Wishlist < ApplicationRecord
  belongs_to :client
  has_many :wishlist_products
end
