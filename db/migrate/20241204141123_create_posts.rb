class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end

    add_index :posts, :user_id, unique: true
    add_index :posts, :title
    add_index :posts, :body
  end
end
