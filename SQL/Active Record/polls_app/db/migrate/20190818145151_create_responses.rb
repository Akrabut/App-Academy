class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.text :body, null: false
      t.integer :answer_choice_id, null: false
      t.integer :respondent_id, null: false
      t.timestamps
    end
  end
end
