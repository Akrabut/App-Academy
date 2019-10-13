class AddRequesterId < ActiveRecord::Migration[5.2]
  def change
    add_column :cat_rental_requests, :user_id, :integer, foreign_key: true, index: true
  end
end
