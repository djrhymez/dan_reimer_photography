class TextTag < ApplicationRecord
  validates :name, presence: true
  
  has_many :product_text_tags
end
