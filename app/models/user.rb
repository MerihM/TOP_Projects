class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :username, :email, :password, presence: true, uniqueness: true
    validates :password, length: { minimum: 10 }, uniqueness: true

    has_many :posts
end
