class AddFk < ActiveRecord::Migration[7.0]
  def change
    create_join_table :events, :users do |t|
      t.index :event_id
      t.index :user_id
      t.timestamps null: false
    end
  end
end
