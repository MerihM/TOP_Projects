class User < ApplicationRecord

    validates :username, :email, :password, presence: true, uniqueness: true
    validates :password, length: { minimum: 10 }, uniqueness: true
end
