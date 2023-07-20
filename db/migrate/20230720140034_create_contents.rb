class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|

      t.string :title
      t.text :body
      t.timestamps
    end
    add_reference :contents, :user, foreign_key: true

  end
end
