class CreateUserGroupCombinations < ActiveRecord::Migration[6.1]
  def change
    create_table :user_group_combinations do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :group_id, null: false, foreign_key: true
      t.integer :status, null: false, default: 0

      t.timestamps

      t.index [:user_id, :group_id], unique: true
    end
  end
end
