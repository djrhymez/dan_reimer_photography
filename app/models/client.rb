class Client < ApplicationRecord
  validates :user_id, presence: true
  has_many :orders
  belongs_to :user
  belongs_to :province
end
