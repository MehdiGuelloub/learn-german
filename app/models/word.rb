class Word < ApplicationRecord
    validates :word, uniqueness: { case_sensitive: false }
    validate :is_german_word

    private

    def is_german_word
        begin
            res = ::Faraday.get "https://linguee-api.herokuapp.com/api?q=#{word}&src=de&dst=en"
            json_body = JSON.parse(res.body)
            raise "Word not found" unless json_body.fetch('exact_matches', []).map{ |t| t.fetch('text', '') }.include?(word)
        rescue
            errors.add(:word, "doesn't exist in German dictionnary")
        end
    end
end
