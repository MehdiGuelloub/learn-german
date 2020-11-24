class CreateTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :terms do |t|
      t.string :type, null: false
      t.string :base, null: false
      t.string :meaning, null: false
      # Verb
      t.string :perfect
      t.string :praeteritum
      # Noun
      t.integer :article
      t.string :plural
      # Adjective
      t.string :comparative
      t.string :superlative
      t.timestamps
    end

    create_table :examples do |t|
      t.references :term, null: false
      t.string :sentence, null: false
      t.string :keyword, null: false
      t.timestamps
    end

    create_table :attempts do |t|
      t.references :term, null: false
      t.boolean :correct, null: false
      # t.integer :attempt_type, null: false
      t.timestamps
    end
  end
end
