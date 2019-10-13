class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.date :brith_date, null: false
      t.string :color, null: false
      t.string :sex, null: false, limit: 1
      t.text :description
      t.timestamps
    end
    add_index :cats, :name
  end
end
