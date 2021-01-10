class ImproveWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :word_type, :integer, default: 0, null: false
    add_column :words, :perfect, :string
    add_column :words, :praeteritum, :string
    add_column :words, :plural, :string
    add_column :words, :comparative, :string
    add_column :words, :superlative, :string
    remove_column :words, :article_attempts, :string
    remove_column :words, :article_mistakes, :string
    remove_column :words, :article_consecutive_correct_answers, :string
    remove_column :words, :migrated, :string
    remove_column :words, :migrated_back, :string
    drop_table :attempts do |t|
    end
    drop_table :examples do |t|
    end
    drop_table :terms do |t|
    end
    drop_table :meanings do |t|
    end
  end
end
