class Term < ApplicationRecord
  has_many :examples
  has_many :attempts

  scope :search, -> (term) { where("base ILIKE ?", "%#{term}%").or(where("meaning ILIKE ?", "%#{term}%")) }

  validates :type, inclusion: { in: %w(Verb Noun Adjective), message: "%{value} is not a valid type" }
  before_save :parse_words_and_meanings

  def meanings
    meanings = [meaning]
    meanings.concat meanings_accepted.split(', ') if meanings_accepted.present?
    meanings.map(&:downcase)
  end

  private

  def parse_words_and_meanings
    self.meaning = self.meaning.strip.downcase
    self.base = self.base.strip

    if self.type == 'Noun'
      self.base = self.base.capitalize
    else
      self.base = self.base.downcase
    end
  end
end
