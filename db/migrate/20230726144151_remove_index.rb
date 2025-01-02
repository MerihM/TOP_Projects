class RemoveIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :events_users, name: "index_events_users_on_event_id"
    remove_index :events_users, name: "index_events_users_on_user_id"
  end
end
