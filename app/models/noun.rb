class Noun < Term
  enum article: {
    'der' => 0,
    'die' => 1,
    'das' => 2,
  }, _prefix: true

  validates :article, presence: true
  validates :base, presence: true
  validates :plural, presence: true
  validates :meaning, presence: true
end
