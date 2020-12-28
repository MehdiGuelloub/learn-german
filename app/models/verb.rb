class Verb < Term
  validates :base, presence: true
  validates :perfect, presence: true
  validates :praeteritum, presence: true
  validates :meaning, presence: true
end
