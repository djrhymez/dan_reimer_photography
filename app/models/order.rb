class Order < ApplicationRecord
  validates :status, presence: true
  belongs_to :client
  has_many :line_items
end
