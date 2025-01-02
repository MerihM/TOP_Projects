class DropJoin < ActiveRecord::Migration[7.0]
  def change
    drop_table :events_users
  end
end
