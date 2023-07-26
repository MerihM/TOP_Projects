class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
    # has_many :events_users, dependent: :destroy
    # has_many :attendees, through: :events_users, source: :user
end
