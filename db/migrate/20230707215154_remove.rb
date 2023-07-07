class Remove < ActiveRecord::Migration[7.0]
  def change
    remove_index :password, name: 'index_users_on_password'
  end
end
