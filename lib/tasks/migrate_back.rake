task migrate_back: :environment do
  Example.find_in_batches do |examples|
    ActiveRecord::Base.transaction do
      examples.each do |example|
        Word.create!(
          :article          => example.term.article.presence || 0,
          :word             => example.term.base,
          :meaning          => example.term.meaning,
          :example          => example.sentence,
          :keyword          => example.keyword,
          :migrated_back    => true,
          :notes            => example.term.meanings_accepted
        )
      end
    end
  end
end
