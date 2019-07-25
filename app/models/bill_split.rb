class BillSplit < ApplicationRecord
  belongs_to :flatmate
  belongs_to :bill
end
