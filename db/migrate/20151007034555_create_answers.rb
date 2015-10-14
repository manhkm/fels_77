class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :word, index: true, foreign_key: true
      t.text :content
      t.boolean :correct_answer

      t.timestamps null: false
    end
  end
end
