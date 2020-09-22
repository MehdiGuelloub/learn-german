class AddArticleToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :article, :integer, default: 0, null: false
    change_column :words, :word, :string, null: false
    change_column :words, :attempts, :integer, default: 0, null: false
    change_column :words, :mistakes, :integer, default: 0, null: false
  end
end
