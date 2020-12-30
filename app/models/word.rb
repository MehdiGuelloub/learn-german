class Word < ApplicationRecord
    before_save :parse_words_and_meanings

    enum article: {
        'none' => 0,
        'der' => 1,
        'die' => 2,
        'das' => 3,
    }, _prefix: true

    validate :example_includes_keyword

    scope :most_attempted, -> { where(attempts: maximum(:attempts)) }
    scope :never_attempted, -> { where(attempts: 0) }
    scope :search, -> (term) { where("word ILIKE ?", "%#{term}%").or(where("meaning ILIKE ?", "%#{term}%")) }
    scope :mistaken, -> { where.not(attempts: 0).where(consecutive_correct_answers: 0) }
    scope :total_attempts, -> { sum(:attempts) }
    scope :total_mistakes, -> { sum(:mistakes) }
    scope :mistak_by_attempts, -> { sum(:mistakes).to_f / sum(:attempts).to_f * 100 }

    def other_meanings
        Word.where(word: word).where.not(id: id)
    end

    private
  
    def example_includes_keyword
      keyword_parts = keyword.split(', ')
      unless keyword_parts.all?{|part| example.include? part}
        errors.add(:example, "should contain keyword")
      end
    end

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
