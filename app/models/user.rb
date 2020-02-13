class User < ApplicationRecord
    has_many :favorites
    has_many :books, through: :favorites
    has_secure_password
    validates :username, uniqueness: { message: "is already in use. Try again!"}, length: {minimum:2}, length: {maximum:20}
    validates :password, :length => {:within => 3..20}
    validates_presence_of :username, :email, :password
    
end
