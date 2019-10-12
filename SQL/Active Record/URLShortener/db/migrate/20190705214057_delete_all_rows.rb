class DeleteAllRows < ActiveRecord::Migration[5.2]
  def change
    User.find_each(&:delete)
    ShortenedUrl.find_each(&:delete)
  end
end
