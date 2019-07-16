class Flat < ApplicationRecord
  has_one :calender, :dependent => :destroy
  has_many :flatmates
  has_many :events, through: :flatmates
  has_one :shopping_list, :dependent => :destroy
  has_many :items, through: :shopping_list
  has_many :tasks

end
