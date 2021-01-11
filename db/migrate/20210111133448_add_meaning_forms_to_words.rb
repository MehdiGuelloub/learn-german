class AddMeaningFormsToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :meaning_forms, :string
  end
end
