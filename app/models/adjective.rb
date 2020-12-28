class Adjective < Term
    validates :base, presence: true
    validates :comparative, presence: true
    validates :superlative, presence: true
    validates :meaning, presence: true
end
