class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.integer :owner_id, null: false, foreign_key: true
      t.string :name, null: false
      t.text :body, null: false

      t.timestamps
    end

    add_index :groups, :owner_id
    add_index :groups, :name, unique: true
    #add_index :groups, :body
  end
end
