class AddExampleToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :example, :string
    add_column :words, :keyword, :string
    add_column :words, :migrated_back, :boolean
  end
end
