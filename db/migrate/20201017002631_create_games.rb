class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.string :genre
      t.integer :creator_id
      t.integer :user_id

      t.timestamps
    end
  end
end
