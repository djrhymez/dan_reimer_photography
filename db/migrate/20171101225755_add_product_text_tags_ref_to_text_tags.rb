class AddProductTextTagsRefToTextTags < ActiveRecord::Migration[5.1]
  def change
    add_reference :text_tags, :product_text_tag, foreign_key: true
  end
end
