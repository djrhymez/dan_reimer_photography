class ChangeColumnNameIdWishlistId < ActiveRecord::Migration[5.1]
  def change
    rename_column :wishlist_products, :wishlist_ID, :wishlist_id
  end
end
