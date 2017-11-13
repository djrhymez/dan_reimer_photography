class Contact < ApplicationRecord
  validates :welcome_message, :email, :phone, presence: true
end
