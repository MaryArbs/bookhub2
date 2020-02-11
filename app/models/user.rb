class User < ApplicationRecord
    has_many :favorites
    has_many :books, through: :favorites
    has_secure_password
    validates :username, uniqueness: { message: "is already in use. Try again!"}
    validates :username, :email, presence: true

end
