class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :content_jp
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :words, :content_jp, unique: true
  end
end
