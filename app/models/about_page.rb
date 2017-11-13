class AboutPage < ApplicationRecord
  validates :header, :message, presence: true
end
