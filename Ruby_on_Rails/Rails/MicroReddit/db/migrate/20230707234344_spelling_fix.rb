class SpellingFix < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :posts, :users_id, :user_id
  end
  def self.down
  end
end
