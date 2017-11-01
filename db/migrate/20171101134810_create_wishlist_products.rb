class CreateWishlistProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :wishlist_products do |t|
      t.integer :wishlist_ID
      t.integer :product_ID

      t.timestamps
    end
  end
end
