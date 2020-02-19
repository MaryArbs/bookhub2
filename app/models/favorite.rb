class Favorite < ApplicationRecord
    belongs_to :book
    belongs_to :user 
    validates :review, presence: true 
    validates :book_id, presence:{message:"You already added this book!"}, :uniqueness => true
    
end