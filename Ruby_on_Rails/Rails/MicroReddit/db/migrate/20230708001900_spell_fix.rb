class SpellFix < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :comments, :users_id, :user_id
    rename_column :comments, :posts_id, :post_id
  end
  def self.down
  end
end
