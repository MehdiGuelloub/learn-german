class Word < ApplicationRecord
    before_save :parse_words_and_meanings

    enum article: {
        'none'  => 0,
        'der'   => 1,
        'die'   => 2,
        'das'   => 3,
    }, _prefix: true

    enum word_type: {
        # 'none' => 0,
        'verb'      => 1,
        'noun'      => 2,
        'adjective' => 3,
        'other'     => 4,
    }, _prefix: true

    enum learned_status: {
        'to_learn'      => 0,
        'learned'       => 1,
        'golden_list'   => 2,
        'not_to_learn'  => 3,
    }, _prefix: true

    enum verb_preposition: {
        'an'        => 0,
        'auf'       => 1,
        'aus'       => 2,
        'bei'       => 3,
        'bis'       => 4,
        'durch'     => 5,
        'entlang'   => 6,
        'für'       => 7,
        'gegen'     => 8,
        'hinter'    => 9,
        'in'        => 10,
        'mit'       => 11,
        'nach'      => 12,
        'neben'     => 13,
        'ohne'      => 14,
        'seit'      => 15,
        'um'        => 16,
        'von'       => 17,
        'zu'        => 18,
        'vor'       => 19,
        'über'      => 20,
        'außer'     => 21,
        'gegenüber' => 22,
        'unter'     => 23,
        'zwischen'  => 24,
    }, _prefix: true

    validate :example_includes_keyword, :on => :create

    scope :most_attempted, -> { where(attempts: maximum(:attempts)) }
    scope :never_attempted, -> { where(attempts: 0) }
    scope :search, -> (term) { where("word ILIKE ?", "%#{term}%").or(where("meaning ILIKE ?", "%#{term}%")) }
    scope :mistaken, -> { where.not(attempts: 0).where(consecutive_correct_answers: 0) }
    scope :learned, -> { where(learned: true) }
    scope :total_attempts, -> { sum(:attempts) }
    scope :total_mistakes, -> { sum(:mistakes) }
    scope :mistak_by_attempts, -> { sum(:mistakes).to_f / sum(:attempts).to_f * 100 }
    scope :filter_by_learned_status, -> (status) do
        case status
        when 'to_learn'
            where(learned: false)
        when 'learned' 
            learned
        end
    end

    def other_meanings
        Word.where(word: word).where.not(id: id)
    end

    def accepted_forms_for_word
        forms = []
        forms << word
        forms << perfect
        forms << praeteritum
        forms << plural
        forms << comparative
        forms << superlative
        forms.compact.map(&:downcase)
    end

    def accepted_forms_for_meaning
        meanings = [meaning]
        meanings.concat meaning_forms.split(', ') if meaning_forms.present?
        meanings.compact.map(&:downcase)
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
