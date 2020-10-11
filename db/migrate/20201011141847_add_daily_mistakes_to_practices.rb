class AddDailyMistakesToPractices < ActiveRecord::Migration[6.0]
  def change
    add_column :practices, :number_of_mistakes_per_day, :integer, null: false, default: 0
  end
end
