class Item < ApplicationRecord
  belongs_to :shopping_list

  # validates :name, length: {maximum: 100}
end
