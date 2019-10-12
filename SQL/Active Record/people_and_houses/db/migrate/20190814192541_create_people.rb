class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    drop_table :people
    create_table :people do |t|
      t.string :name
      t.integer :house_id
      t.timestamps
    end
  end
end
