class User < ApplicationRecord
    has_many :favorites
    has_many :books, through: :favorites
    has_secure_password
    validates :email, :email, presence: true,  uniqueness: { message: "is already in use. Try again!"}

end
