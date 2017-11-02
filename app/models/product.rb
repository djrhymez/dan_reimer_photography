class Product < ApplicationRecord
  has_many :product_text_tags
  belongs_to :category

  #Paperclip support
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates_attachment_file_name :image, :matches => [/\.(gif|jpg|jpeg|tiff|png)$/]
validates_uniqueness_of :image_file_name # this is a standard ActiveRecord validator

end
