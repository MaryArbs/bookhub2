class User < ApplicationRecord
    has_many :favorites
    has_many :books, through: :favorites
    has_secure_password
    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true
end
