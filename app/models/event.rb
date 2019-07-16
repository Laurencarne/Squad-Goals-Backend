class Event < ApplicationRecord
  belongs_to :flatmate
  has_one :calender, through: :flatmate
end
