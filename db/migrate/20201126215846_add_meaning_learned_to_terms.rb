class AddMeaningLearnedToTerms < ActiveRecord::Migration[6.0]
  def change
    add_column :terms, :meaning_learned, :boolean, default: false, null: false
  end
end
