class Changedate < ActiveRecord::Migration[6.0]
  def change
    change_column :cats, :brith_date, :date, name: :birth_date
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
