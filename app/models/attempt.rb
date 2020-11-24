class Attempt < ApplicationRecord
  belongs_to :term

  scope :mistakes, -> { where(correct: false) }
end
