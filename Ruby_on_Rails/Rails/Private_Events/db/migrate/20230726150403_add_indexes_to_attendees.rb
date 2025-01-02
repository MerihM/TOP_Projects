class AddIndexesToAttendees < ActiveRecord::Migration[7.0]
  def change
    add_reference :attendees, :user, foreign_key: true
    add_reference :attendees, :event, foreign_key: true
  end
end
