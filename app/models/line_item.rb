class LineItem < ApplicationRecord
  validates :quantity, :price, presence: true
  validates :quantity, :price, numericality: true
  
  belongs_to :order
  has_many :products
end
