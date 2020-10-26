class Word < ApplicationRecord
    validates :word, uniqueness: { case_sensitive: false }
    before_save :parse_words_and_meanings

    enum article: {
        'none' => 0,
        'der' => 1,
        'die' => 2,
        'das' => 3,
    }, _prefix: true

    scope :most_attempted, -> { where(attempts: maximum(:attempts)) }
    scope :never_attempted, -> { where(attempts: 0) }
    scope :search, -> (term) { where("word ILIKE ?", "%#{term}%").or(where("meaning ILIKE ?", "%#{term}%")) }
    scope :mistaken, -> { where.not(attempts: 0).where(consecutive_correct_answers: 0) }
    scope :total_attempts, -> { sum(:attempts) }
    scope :total_mistakes, -> { sum(:mistakes) }
    scope :mistak_by_attempts, -> { sum(:mistakes).to_f / sum(:attempts).to_f * 100 }

    private

    def parse_words_and_meanings
        self.meaning = self.meaning.strip.capitalize
        self.word = self.word.strip

        if self.article_none?
            self.word = self.word.downcase
        else
            self.word = self.word.capitalize
        end
    end
end
