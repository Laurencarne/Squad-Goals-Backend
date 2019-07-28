class Bill < ApplicationRecord
  has_many :bill_splits
  has_many :flatmates, through: :bill_splits

  def flatmate_ids=(flatmate_ids)
    flatmate_ids.map do |flatmate|
      self.bill_splits.build(flatmate).save
    end
  end



end
