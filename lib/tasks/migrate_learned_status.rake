task migrate_learned_status: :environment do
  to_learn_preposition = 0
  meaning_learned = 0
  to_learn_meaning = 0
  Word.find_in_batches do |words|
    ActiveRecord::Base.transaction do
      puts "Starting migration..."
      words.each do |word|
        case
        when word.meaning == "Not important"
          word.update! learned_status: :to_learn_preposition
          to_learn_preposition += 1
          next
        when word.learned == true
          word.update! learned_status: :meaning_learned
          meaning_learned += 1
          next
        else
          word.update! learned_status: :to_learn_meaning
          to_learn_meaning += 1
          next
        end
      end
    end
  end
  puts to_learn_preposition
  puts meaning_learned
  puts to_learn_meaning
end
