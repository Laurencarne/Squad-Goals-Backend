class Bill < ApplicationRecord
  has_many :bill_splits
  has_many :flatmates, through: :bill_splits
end
