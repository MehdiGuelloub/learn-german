class Attempt < ApplicationRecord
  belongs_to :term

  scope :correct, -> { where(correct: true) }
  scope :mistakes, -> { where(correct: false) }
end
