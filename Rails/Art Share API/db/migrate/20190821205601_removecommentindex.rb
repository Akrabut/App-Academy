class Removecommentindex < ActiveRecord::Migration[6.0]
  def change
    remove_index :comments, %i[user_id artwork_id]
  end
end
