class CreateInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiries do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :email, null: :false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_index :inquiries, :user_id
    add_index :inquiries, :status
  end
end
