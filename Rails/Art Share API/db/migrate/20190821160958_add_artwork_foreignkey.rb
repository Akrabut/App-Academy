class AddArtworkForeignkey < ActiveRecord::Migration[6.0]
  def change
    change_column :artworks, :artist_id, :integer, foreign_key: true
  end
end
