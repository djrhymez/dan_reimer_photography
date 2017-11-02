class AddProductRefToProductTextTags < ActiveRecord::Migration[5.1]
  def change
    add_reference :product_text_tags, :product, foreign_key: true
  end
end
