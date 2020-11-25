class Term < ApplicationRecord
  has_many :examples
  has_many :attempts

  scope :search, -> (term) { where("base ILIKE ?", "%#{term}%").or(where("meaning ILIKE ?", "%#{term}%")) }

  validates :type, inclusion: { in: %w(Verb Noun Adjective), message: "%{value} is not a valid type" }
end
