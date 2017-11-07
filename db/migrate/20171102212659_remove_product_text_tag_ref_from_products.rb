class RemoveProductTextTagRefFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_reference :products, :product_text_tag, foreign_key: true
  end
end
