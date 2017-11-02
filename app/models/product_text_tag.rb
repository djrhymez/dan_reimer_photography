class ProductTextTag < ApplicationRecord
  belongs_to :product, foreign_key: "product_id"
  belongs_to :text_tag, foreign_key: "text_tag_id"
end
