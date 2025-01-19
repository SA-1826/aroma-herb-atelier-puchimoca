class CreatePrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :programs do |t|
      t.integer :admin_id, null: false, foreign_key: true
      t.integer :category_id, null: false, foreign_key: true
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :start_time, null: false
      t.integer :publish_status, null: false, default: 0
      t.integer :price, null: false, default: 0
      t.integer :time_required, null: false, default: 0

      t.timestamps

      t.index [:title, :start_time], unique: true
    end

    add_index :programs, :admin_id
    add_index :programs, :category_id
  end
end
