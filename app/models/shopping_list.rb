class ShoppingList < ApplicationRecord
  belongs_to :flat
  has_many :items
  has_many :flatmates, through: :flat
end
