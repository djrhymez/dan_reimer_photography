class AddProductTextTagsRefToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :product_text_tag, foreign_key: true
  end
end
