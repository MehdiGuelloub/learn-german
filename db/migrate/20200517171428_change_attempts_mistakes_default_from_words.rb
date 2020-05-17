class ChangeAttemptsMistakesDefaultFromWords < ActiveRecord::Migration[6.0]
  def change
    change_column :words, :attempts, :integer, :default => 0
    change_column :words, :mistakes, :integer, :default => 0
  end
end
