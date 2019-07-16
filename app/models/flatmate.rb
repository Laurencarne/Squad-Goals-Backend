class Flatmate < ApplicationRecord
  has_many :notes
  has_many :events
  belongs_to :flat, optional: true
  has_one :calender, through: :flat
  has_many :tasks, through: :flat
  has_one :shopping_list, through: :flat
  has_many :items, through: :shopping_list

  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}
end
