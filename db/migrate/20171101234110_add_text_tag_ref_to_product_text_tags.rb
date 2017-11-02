class AddTextTagRefToProductTextTags < ActiveRecord::Migration[5.1]
  def change
    add_reference :product_text_tags, :text_tag, foreign_key: true
  end
end
