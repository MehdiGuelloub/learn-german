class CreatePractices < ActiveRecord::Migration[6.0]
  def change
    create_table :practices do |t|
      t.integer :number_of_practiced_words_per_day, default: 0, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
