class RemoveUnique < ActiveRecord::Migration[7.0]
  def change
    remove_index ["username", "email"], name: "index_users_on_username_and_email"
  end
end
