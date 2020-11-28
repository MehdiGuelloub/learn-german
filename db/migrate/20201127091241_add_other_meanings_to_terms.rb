class AddOtherMeaningsToTerms < ActiveRecord::Migration[6.0]
  def change
    add_column :terms, :meanings_accepted, :string
  end
end
