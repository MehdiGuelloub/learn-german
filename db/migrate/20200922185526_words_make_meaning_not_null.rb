class WordsMakeMeaningNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column :words, :meaning, :string, null: false
  end
end
