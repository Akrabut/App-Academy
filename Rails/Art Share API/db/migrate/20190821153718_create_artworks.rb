class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false, unique: true
      t.integer :artist_id, null: false
      t.timestamps
    end
    add_index :artworks, :title
    add_index :artworks, :artist_id
    add_index :artworks, %i[artist_id title], unique: true
  end
end
