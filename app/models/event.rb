class Event < ApplicationRecord
  belongs_to :flatmate
  has_one :calender, through: :flatmate

  # validates :title, length: { maximum: 50 }
  # validates :description, length: { maximum: 400 }
end
