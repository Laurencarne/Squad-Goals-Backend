class Task < ApplicationRecord
  belongs_to :flat
  has_many :flatmates, through: :flat

  # validates :flat_id, presence: true
  # validates :flatmate_id, presence: true
  # validates :name, length: {in: 2..50}
  # validates :description, length: {maximum: 400}
end
