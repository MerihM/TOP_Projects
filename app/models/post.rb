class Post < ApplicationRecord
    validates :user_id, presence: true
    
    belongs_to :users
    has_many :comments
end
