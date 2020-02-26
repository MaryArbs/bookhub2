class User < ApplicationRecord
    has_many :favorites
    has_many :books, through: :favorites
    has_secure_password
    validates :username, uniqueness: { message: "is already in use. Try again!"}, length: {minimum:2}, length: {maximum:30}
    validates :email, uniqueness: { message: "is already in use. Try again!"}
    validates_presence_of :username, :email, :password
    
end
