class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url
      t.string :short_url
      t.timestamps
    end
    add_index :shortened_urls, :long_url, unique: true
    add_index :shortened_urls, :short_url, unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
