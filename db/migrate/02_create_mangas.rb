class CreateMangas < ActiveRecord::Migration[5.2]
    def change
      create_table :mangas do |t|
        t.string :title
        t.integer :issue
        t.string :arc
        t.string :writer
        t.string :artist
        t.integer :rating
        t.integer :user_id
  
        t.timestamps null: false
      end
    end
  end