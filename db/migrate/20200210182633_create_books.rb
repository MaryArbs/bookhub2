class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :profile_url
      t.integer :author_id

      t.timestamps
    end
  end
end
