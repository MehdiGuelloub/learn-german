class AddLearnedToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :learned, :boolean, default: false
  end
end
