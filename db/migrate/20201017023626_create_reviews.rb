class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :reviewer_id
      t.string :content
      t.integer :game_id

      t.timestamps
    end
  end
end
