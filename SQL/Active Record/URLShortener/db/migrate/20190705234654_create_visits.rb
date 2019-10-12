class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :user_id, presence: true
      t.integer :url_id, presence: true
      t.timestamps
    end
    add_index :visits, :user_id
    add_index :visits, :url_id
  end
end
