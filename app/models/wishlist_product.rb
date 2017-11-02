class WishlistProduct < ApplicationRecord
  validates :wishlist_id, :product_id, presence: true

  belongs_to :wishlist
  has_one :product
end
