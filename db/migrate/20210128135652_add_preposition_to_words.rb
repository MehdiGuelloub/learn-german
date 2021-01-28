class AddPrepositionToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :verb_preposition, :integer
  end
end
