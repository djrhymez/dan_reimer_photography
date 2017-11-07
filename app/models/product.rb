class Product < ApplicationRecord
  validates :name, :description, :price, :stock_quantity, :category_id, presence: true
  validates :price, :stock_quantity, numericality: true

  has_many :product_text_tags
  belongs_to :category
  # belongs_to :line_item
  # has_many :wishlist_products

  #Paperclip support
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates_attachment_file_name :image, :matches => [/\.(gif|jpg|jpeg|tiff|png)$/]
  validates_uniqueness_of :image_file_name # this is a standard ActiveRecord validator

end
