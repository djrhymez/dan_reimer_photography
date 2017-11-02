class Wishlist < ApplicationRecord
  validates :client_id, presence: true
  belongs_to :client
  has_many :wishlist_products
end
