class Product < ApplicationRecord
  has_many :product_text_tags
  belongs_to :category, foreign_key: "category_id"
end
