class AddMigrateToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :migrated, :boolean, default: false
  end
end
