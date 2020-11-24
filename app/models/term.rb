class Term < ApplicationRecord
  has_many :examples
  has_many :attempts

  scope :search, -> (term) { where("base ILIKE ?", "%#{term}%").or(where("meaning ILIKE ?", "%#{term}%")) }
end
