class Noun < Term
  enum article: {
    'der' => 0,
    'die' => 1,
    'das' => 2,
  }, _prefix: true

end
