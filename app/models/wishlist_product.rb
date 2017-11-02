class WishlistProduct < ApplicationRecord
  belongs_to :wishlist
  has_one :product
end
