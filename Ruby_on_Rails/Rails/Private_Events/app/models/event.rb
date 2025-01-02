class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
    has_many :attendees, dependent: :destroy
    has_many :attending, through: :attendees, source: :user
end
