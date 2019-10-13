class DestroyUsers < ActiveRecord::Migration[6.0]
  def change
    User.destroy_all
  end
end
