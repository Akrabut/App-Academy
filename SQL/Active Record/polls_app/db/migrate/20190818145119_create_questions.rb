class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :body, null: false
      t.integer :poll_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
