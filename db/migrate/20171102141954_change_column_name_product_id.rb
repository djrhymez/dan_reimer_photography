class ChangeColumnNameProductId < ActiveRecord::Migration[5.1]
  def change
    rename_column :wishlist_products, :product_ID, :product_id
  end
end
