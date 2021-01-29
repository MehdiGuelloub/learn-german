class AddLearnedStatusToWords < ActiveRecord::Migration[6.0]
  def change
    add_column :words, :learned_status, :integer
  end
end
