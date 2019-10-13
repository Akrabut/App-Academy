class Renamedate < ActiveRecord::Migration[6.0]
  def change
    rename_column :cats, :brith_date, :birth_date
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
