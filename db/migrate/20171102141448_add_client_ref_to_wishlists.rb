class AddClientRefToWishlists < ActiveRecord::Migration[5.1]
  def change
    add_reference :wishlists, :client, foreign_key: true
  end
end
