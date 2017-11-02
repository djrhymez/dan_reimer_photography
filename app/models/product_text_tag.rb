class ProductTextTag < ApplicationRecord
  validates :product_id, :text_tag_id, presence: true

  belongs_to :product, foreign_key: "product_id"
  belongs_to :text_tag, foreign_key: "text_tag_id"
end
