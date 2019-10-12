class RemoveBodyFromResponses < ActiveRecord::Migration[5.2]
  def change
    remove_column :responses, :body
  end
end
