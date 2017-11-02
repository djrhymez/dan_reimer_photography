class RemoveTextTagIdFromProductTextTags < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_text_tags, :text_tag_id_id, :reference
  end
end
