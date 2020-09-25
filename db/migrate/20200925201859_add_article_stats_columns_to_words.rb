class AddArticleStatsColumnsToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :article_attempts, :integer, null: false, default: 0
    add_column :words, :article_mistakes, :integer, null: false, default: 0
    add_column :words, :article_consecutive_correct_answers, :integer, null: false, default: 0
  end
end
