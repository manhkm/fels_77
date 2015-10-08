class CreateUserWords < ActiveRecord::Migration
  def change
    create_table :user_words do |t|
      t.references :user, index: true, foreign_key: true
      t.references :word, index: true, foreign_key: true

      t.timestamps null: false
    end
  add_index :user_words, [:user_id, :word_id], unique: true
  end
end
