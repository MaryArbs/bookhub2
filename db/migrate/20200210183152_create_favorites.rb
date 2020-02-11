class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :book_id
      t.string :review

      t.timestamps
    end
  end
end
