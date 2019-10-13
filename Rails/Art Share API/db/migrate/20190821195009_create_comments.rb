class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false, foreign_key: true, index: true
      t.integer :artwork_id, null: false, foreign_key: true, index: true
      t.text :body, null: false
      t.timestamps
    end
    add_index :comments, %i[user_id artwork_id], unique: true
  end
end
