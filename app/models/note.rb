class Note < ApplicationRecord
  belongs_to :flatmate

  # validates :note, length: {maximum: 400}
end
