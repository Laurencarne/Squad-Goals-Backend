class Calender < ApplicationRecord
  belongs_to :flat
  # validates :flat_id, presence: true
end
