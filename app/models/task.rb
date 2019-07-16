class Task < ApplicationRecord
  belongs_to :flat
  has_many :flatmates, through: :flat
end
