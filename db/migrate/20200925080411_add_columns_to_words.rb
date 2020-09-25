class AddColumnsToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :consecutive_correct_answers, :integer, null: false, default: 0
    rename_column :words, :example, :notes
  end
end
