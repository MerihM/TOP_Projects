class User < ApplicationRecord
    validates :username, length: {in: 5..50, message: 'Minimum 5 characters'}
    validates :password, length: {minimum: 7, message: 'Minimum 7 characters'}
    # validates :password, format: { with: /\[A-Z]+\/, message: 'regex validation test'}
    has_many :posts
    has_many :comments
end
