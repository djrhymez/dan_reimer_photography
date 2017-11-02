class Order < ApplicationRecord
  belongs_to :client
  has_many :line_items
end
