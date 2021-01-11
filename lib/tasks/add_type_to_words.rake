task add_type_to_words: :environment do
  Word.find_in_batches do |words|
    ActiveRecord::Base.transaction do
      words.each do |word|
        word.update!(word_type: Word.word_types[:noun])
      end
    end
  end
end
