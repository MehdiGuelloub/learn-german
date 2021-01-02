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

  def error_rate
    attempts_correct_count = attempts.correct.count
    attempts_count= attempts.count
    if attempts_correct_count.zero? || attempts_count.zero?
      0
    else
      attempts_correct_count / attempts_count
    end
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
