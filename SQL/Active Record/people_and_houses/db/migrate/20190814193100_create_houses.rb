class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    drop_table :houses
    create_table :houses do |t|
      t.string :address
      t.timestamps
    end
  end
end
