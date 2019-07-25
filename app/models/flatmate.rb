class Flatmate < ApplicationRecord
  has_many :notes
  has_many :events
  belongs_to :flat, optional: true
  has_one :calender, through: :flat
  has_many :tasks, through: :flat
  has_one :shopping_list, through: :flat
  has_many :items, through: :shopping_list
  has_many :bill_splits
  has_many :bills, through: :bill_splits

  has_secure_password
  # validates :username, :email, uniqueness: true
  # validates :username, :password, length: {in: 6..20}
  # validates :first_name, :last_name, length: {in: 2..50}
  # validates :email, confirmation: { case_sensitive: false }
  # validates :email_confirmation, presence: true
  # validates :email, length: {maximum: 100}

end
