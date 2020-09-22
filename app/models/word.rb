class Word < ApplicationRecord
    validates :word, uniqueness: { case_sensitive: false }
    before_save :parse_words_and_meanings

    enum article: {
        'none' => 0,
        'der' => 1,
        'die' => 2,
        'das' => 3,
    }, _prefix: true

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
